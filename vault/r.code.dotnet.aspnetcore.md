---
id: c5nb9531vsvl23snuwem4lc
title: Aspnetcore
desc: ''
updated: 1689753973128
created: 1689753808193
---
## How to get the web url of a service at startup

```csharp
    public class Startup
    {
        //rest code

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            Console.WriteLine($"Web url: {app.GetWebUrl()}");

            //rest code
        }
    }
```

[source](https://stackoverflow.com/a/54546975)