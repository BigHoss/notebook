# dotnet Core related stuff

## Build Console to Exe

```
dotnet publish -c Release -r win10-x64
```

## Update Tool

```
dotnet tool update --global dotnet-ef
```

# appsettings.json in Console / WPF application

```powershell
install-package Microsoft.Extensions.Configuration
install-package Microsoft.Extensions.Configuration.Json
install-package Microsoft.Extensions.Configuration.FileExtensions
```

```csharp
var configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetParent(AppContext.BaseDirectory).FullName)
                .AddJsonFile("appsettings.json", false)
                .Build();
```

# Ngrok for debugging

```ngrok http https://localhost:5001 -host-header="localhost:5001"```
[source](https://www.jerriepelser.com/blog/using-ngrok-with-aspnet-core/)
