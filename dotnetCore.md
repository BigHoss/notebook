# dotnet Core related stuff

## Build Console to Exe
```
dotnet publish -c Release -r win10-x64
```

## Update Tool
```
dotnet tool update --global dotnet-ef
```


# GRPC Service hosted in Asp.net Core

## Error message on Client Status(StatusCode=Unknown, Detail="Stream removed")
```csharp
public static IHostBuilder CreateHostBuilder(string[] args) =>
    Host.CreateDefaultBuilder(args)
        .ConfigureWebHostDefaults(webBuilder =>
        {
            webBuilder.ConfigureKestrel(options =>
            {
                // This endpoint will use HTTP/2 and HTTPS on port 5001.
                options.Listen(IPAddress.Any, 5001, listenOptions =>
                {
                    listenOptions.Protocols = HttpProtocols.Http2;
                });
            });

            webBuilder.UseStartup<Startup>();
        });
```
[Source](https://stackoverflow.com/a/57819978)
