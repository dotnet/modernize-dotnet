#!/bin/bash

# Return success and exit. The hook must never block the host tool call,
# so all error paths funnel through this function.
write_success() {
    echo '{"continue":true}'
    exit 0
}

# Read entire stdin at once - hooks send one complete JSON per invocation
INPUT=$(cat)
if [ -z "$INPUT" ]; then
    write_success
fi

# Setup log directory
TEMP_ROOT="${TMPDIR:-/tmp}"
LOG_DIR="${TEMP_ROOT%/}/UA/upgrades/skills-loaded"
mkdir -p "$LOG_DIR" 2>/dev/null

# Extract a JSON string field. Tries jq, then python3, then 
# grep/sed fallback. Returns empty string if the field is missing or no
# JSON parser is available.
# Usage: extract_field <json> <key1> [key2 ...]
# Returns the first non-empty value found among the candidate keys.
extract_field() {
    local json="$1"
    shift
    local key

    if command -v jq >/dev/null 2>&1; then
        for key in "$@"; do
            local val
            val=$(printf '%s' "$json" | jq -r --arg k "$key" '
                (.[$k] // .tool_input[$k]? // .toolArgs[$k]? // empty)
                | select(type == "string")
            ' 2>/dev/null)
            if [ -n "$val" ]; then
                echo "$val"
                return
            fi
        done
        return
    fi

    if command -v python3 >/dev/null 2>&1; then
        printf '%s' "$json" | KEYS="$*" python3 -c "
import sys, json, os
try:
    d = json.load(sys.stdin)
except Exception:
    sys.exit(0)
keys = os.environ.get('KEYS', '').split()
for k in keys:
    for src in (d, d.get('tool_input') or {}, d.get('toolArgs') or {}):
        if isinstance(src, dict):
            v = src.get(k)
            if isinstance(v, str) and v:
                print(v)
                sys.exit(0)
" 2>/dev/null
        return
    fi

    # Last-resort: naive regex after flattening JSON to one line.
    # Searches anywhere in the payload, so works for nested fields.
    # Limitation: won't handle escaped quotes within string values.
    for key in "$@"; do
        local val
        val=$(printf '%s' "$json" \
            | tr -d '\n' \
            | grep -oE "\"$key\"[[:space:]]*:[[:space:]]*\"[^\"]*\"" \
            | head -n 1 \
            | sed -E "s/.*\"$key\"[[:space:]]*:[[:space:]]*\"([^\"]*)\".*/\1/")
        if [ -n "$val" ]; then
            echo "$val"
            return
        fi
    done
}

# Extract tool name. Supports Copilot CLI (camelCase), VS Code
# (snake_case), and Claude (PascalCase, e.g. "Read").
TOOL_NAME=$(extract_field "$INPUT" tool_name toolName)

# Only log file-read tools
case "$TOOL_NAME" in
    read_file|view|Read) ;;
    *) write_success ;;
esac

# Extract file path from any of the known shapes
FILE_PATH=$(extract_field "$INPUT" file_path filePath path)
if [ -z "$FILE_PATH" ]; then
    write_success
fi

# Normalize path separators for comparison
FILE_PATH_NORMALIZED="${FILE_PATH//\\//}"

# Check if this is a SKILL.md file from .upgrades
if echo "$FILE_PATH_NORMALIZED" | grep -qE '\.upgrades/[^/]+/skills/.*/([^/]+)/SKILL\.md$'; then
    # Extract skill name (the directory containing the SKILL.md file)
    SKILL_NAME=$(echo "$FILE_PATH_NORMALIZED" | sed -E 's|.*\.upgrades/[^/]+/skills/.*/([^/]+)/SKILL\.md$|\1|')

    # Extract session_id from hook input
    SESSION_ID=$(extract_field "$INPUT" session_id)
    
    # Use "unknown" if session_id not provided
    if [ -z "$SESSION_ID" ]; then
        SESSION_ID="unknown"
    fi
    
    # Generate timestamp
    if command -v python3 >/dev/null 2>&1; then
        TIMESTAMP=$(python3 -c "from datetime import datetime; print(datetime.now().strftime('%Y-%m-%d %H:%M:%S.%f')[:-3])" 2>/dev/null)
    fi
    if [ -z "$TIMESTAMP" ]; then
        TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
    fi

    # Log in format: timestamp, skillname
    LOG_FILE="$LOG_DIR/progressive-loads-$SESSION_ID.txt"
    echo "$TIMESTAMP, $SKILL_NAME" >> "$LOG_FILE"
fi

write_success
