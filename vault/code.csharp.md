---
id: 7ujZGDzacQ2Lh0MoIRzG2
title: Csharp
desc: ''
updated: 1640939137521
created: 1640939075530
---
### C#
Here are some snippets and code parts that helped me on my way

#### Misc Links
* [Choosing the right Collection](https://www.codeproject.com/Articles/1095822/Choosing-The-Right-Collection)


#### System.Flags
```csharp
[Flags]
public enum MyEnum
{
    None   = 0,
    First  = 1 << 0,
    Second = 1 << 1,
    Third  = 1 << 2,
    Fourth = 1 << 3
}
```


#### Todo Snippet
```xml
<?xml version="1.0" encoding="utf-8"?>  
<CodeSnippets  
    xmlns="http://schemas.microsoft.com/VisualStudio/2005/CodeSnippet">  
    <CodeSnippet Format="1.0.0">  
        <Header>  
            <Title>Todo-Rk</Title>  
            <Author>Raphael Kuster</Author>
            <Description>Adds a todo for me</Description>
            <Shortcut>tdrk</Shortcut>
        </Header>  
        <Snippet>  
            <Code Language="csharp">  
                <![CDATA[//TODO-RK: ]]>  
            </Code>  
        </Snippet>  
    </CodeSnippet>  
</CodeSnippets>
```

#### Add to *.csproj


#### Connect to network share with Credetials
```csharp
NetworkCredential theNetworkCredential = new NetworkCredential(@"domain\username", "password");
CredentialCache theNetCache = new CredentialCache();
theNetCache.Add(new Uri(@"\\computer"), "Basic", theNetworkCredential);
string[] theFolders = Directory.GetDirectories(@"\\computer\share");
```



#### Change items of collection with LINQ
```csharp
result = result.Where(a => a.SourceID == (int)Source.AutomaticImport)
               .Select(c => 
                        { 
                          c.SourceDescription = sourceDescription; 
                          return c; 
                         }
                       )
               .ToList();
```

#### EF Core Migrations
```powershell
Add-Migration -Name MyMigration -OutputDir MyMigrationDir -Context MyContext -Project MyProject -StartupProject MyStartupProject
```

[Source](https://github.com/aspnet/EntityFramework/issues/4149)

#### Elevate Process ("Run as Admin")
```csharp
  if (IsAdministrator() == false)
  {
      // Restart program and run as admin
      var exeName = System.Diagnostics.Process.GetCurrentProcess().MainModule.FileName;
      ProcessStartInfo startInfo = new ProcessStartInfo(exeName);
      startInfo.Verb = "runas";
      System.Diagnostics.Process.Start(startInfo);
      Application.Current.Shutdown();
      return;
  }

  private static bool IsAdministrator()
  {
      WindowsIdentity identity = WindowsIdentity.GetCurrent();
      WindowsPrincipal principal = new WindowsPrincipal(identity);
      return principal.IsInRole(WindowsBuiltInRole.Administrator);
  }

  // To run as admin, alter exe manifest file after building.
  // Or create shortcut with "as admin" checked.
  // Or ShellExecute(C# Process.Start) can elevate - use verb "runas".
  // Or an elevate vbs script can launch programs as admin.
  // (does not work: "runas /user:admin" from cmd-line prompts for admin pass)
```
[Source](https://stackoverflow.com/questions/8447/what-does-the-flags-enum-attribute-mean-in-c)


#### Set current directory
```csharp
System.IO.Directory.SetCurrentDirectory(System.AppDomain.CurrentDomain.BaseDirectory);
```


