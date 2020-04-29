### System.Flags
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


### Todo Snippet
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

### Add to *.csproj


### Connect to network share with Credetials
```csharp
NetworkCredential theNetworkCredential = new NetworkCredential(@"domain\username", "password");
CredentialCache theNetCache = new CredentialCache();
theNetCache.Add(new Uri(@"\\computer"), "Basic", theNetworkCredential);
string[] theFolders = Directory.GetDirectories(@"\\computer\share");
```
