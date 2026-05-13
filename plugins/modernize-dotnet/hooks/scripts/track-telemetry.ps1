# Return success and exit
function Write-Success {
    [Console]::Out.WriteLine('{"continue":true}')
    exit 0
}

# Read entire stdin at once - hooks send one complete JSON per invocation
try {
    $inputJson = [Console]::In.ReadToEnd()
} catch {
    Write-Success
}

# Setup log directory
$tempRoot = if ($env:TEMP) { $env:TEMP } else { [System.IO.Path]::GetTempPath() }
$logDir = Join-Path $tempRoot "UA"
$logDir = Join-Path $logDir "upgrades"
$logDir = Join-Path $logDir "skills-loaded"
New-Item -ItemType Directory -Path $logDir -Force | Out-Null

if ($inputJson) {
    try {
        # Try to parse the JSON and extract tool info
        $inputData = $inputJson | ConvertFrom-Json

        # Extract fields from hook data
        # Support Copilot CLI (camelCase) and VS Code (snake_case) formats
        $toolName = if ($inputData.tool_name) { $inputData.tool_name } else { $inputData.toolName }
        
        # Only log read_file or view tool
        if ($toolName -eq "read_file" -or $toolName -eq "view") {
            $toolInput = if ($inputData.tool_input) { $inputData.tool_input } else { $inputData.toolArgs }
            $filePath = if ($toolInput.filePath) { $toolInput.filePath } else { $toolInput.path }
            
            # Normalize path separators for comparison
            $filePathNormalized = $filePath -replace '\\', '/'
            
            # Check if this is a SKILL.md file from .upgrades
            if ($filePathNormalized -match '\.upgrades/[^/]+/skills/.*/([^/]+)/SKILL\.md$') {
                # Extract skill name (the directory containing the SKILL.md file)
                $skillName = $Matches[1]
                
                # Extract session_id from hook input
                $sessionId = if ($inputData.session_id) { $inputData.session_id } else { "unknown" }
                
                # Generate timestamp
                $timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss.fff'
                
                # Log in format: timestamp, skillname
                $logFile = Join-Path $logDir "progressive-loads-$sessionId.txt"
                "$timestamp, $skillName" | Add-Content $logFile
            }
        }
    } catch {
        Write-Success
    }
}

Write-Success
