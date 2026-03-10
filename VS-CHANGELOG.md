# Changelog - Visual Studio Features

## Baseline (Visual Studio 2026 18.5 Insiders 1)

### Existing Skills

  Cloud
   - migrating-azure-functions-startup — Migrates Azure Functions from in-process Startup hooks to the isolated worker model with 
  Program.cs service registration
   - migrating-azure-functions-to-v2 — Migrates Azure Functions to the v2 hosting pattern using IHostApplicationBuilder and 
  Application Insights

  Common
   - converting-to-sdk-style — Converts legacy non-SDK-style project files to modern SDK-style format
   - integrating-autofac-with-dotnet — Migrates Autofac DI configuration from ASP.NET Framework to ASP.NET Core hosting while 
  retaining Autofac
   - managing-package-references — Manages adding, removing, and updating PackageReference, ProjectReference, and FrameworkReference 
  items
   - managing-target-frameworks — Manages target frameworks including adding, removing, replacing, upgrading, and converting between 
  single/multi-targeting
   - migrating-autofac-to-dotnet-di — Removes Autofac entirely and migrates to ASP.NET Core built-in DI
   - migrating-cryptography-namespaces — Migrates System.Security.Cryptography usage from .NET Framework to modern .NET
   - migrating-newtonsoft-to-system-text-json — Migrates from Newtonsoft.Json to System.Text.Json, handling API differences
   - migrating-semantic-kernel-to-agents — Migrates from Microsoft Semantic Kernel Agents to Microsoft Agent Framework
   - migrating-to-msmq-messaging — Migrates from System.Messaging to MSMQ.Messaging for .NET Core compatibility
   - modifying-project-properties — Modifies PropertyGroup elements in .csproj, .vbproj, and Directory.Build.props files

  Data
   - migrating-edmx-to-code-first — Migrates EF6 EDMX-based models (Database-First/Model-First) to EF Core Code-First
   - migrating-ef-dbcontext — Migrates EF DbContext registration from Global.asax/Startup to ASP.NET Core DI in Program.cs
   - migrating-linq-to-sql-to-ef-core — Migrates LINQ to SQL (System.Data.Linq) data access to Entity Framework Core
   - migrating-to-microsoft-data-sqlclient — Migrates from System.Data.SqlClient to Microsoft.Data.SqlClient

  Libraries
   - migrating-powershell-sdk — Migrates PowerShell SDK references from Windows PowerShell
    5.1 to PowerShell 7+

  Web › ASP.NET
   - migrating-aspnet-identity — Migrates ASP.NET MVC Identity to ASP.NET Core Identity
   - migrating-global-asax — Migrates Global.asax lifecycle events to ASP.NET Core middleware and Program.cs
   - migrating-owin-to-middleware — Migrates OWIN middleware and authentication to native ASP.NET Core equivalents

  Web › MVC
   - migrating-mvc-bundling — Migrates bundling/minification from System.Web.Optimization to direct script/link tags
   - migrating-mvc-filters — Migrates global filters to ASP.NET Core exception handling middleware and filter pipeline
   - migrating-mvc-routing — Converts RouteCollection-based routing to ASP.NET Core endpoint routing

  Web › WCF
   - migrating-wcf-to-corewcf — Migrates server-side WCF services to CoreWCF for .NET 6+

### Existing Scenarios

   - Azure Functions Upgrade — Upgrade Azure Functions from in-process to isolated worker model
   - Azure Migration — Migrate applications to Azure cloud services
   - .NET Version Upgrade — Upgrade .NET projects to newer .NET versions
   - Newtonsoft.Json Conversion — Migrate from Newtonsoft.Json to System.Text.Json
   - SDK-Style Project Conversion — Convert legacy .NET projects to SDK-style format
   - Semantic Kernel to Agents Framework Migration — Migrate from Semantic Kernel to Microsoft Agents Framework
   - SqlClient Migration — Migrate from System.Data.SqlClient to Microsoft.Data.SqlClien