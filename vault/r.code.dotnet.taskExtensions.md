---
id: 2l11kcxysflbzl4bmxn3yz2
title: taskExtensions
desc: ''
updated: 1683531316731
created: 1683531313694
---

## fire and forget

```csharp
public static void FireAndForget(
  this Task task,
  Action<Exception> errorHandler = null)
{
    task.ContinueWith(t =>
    {
        if (t.IsFaulted && errorHandler != null)
            errorHandler(t.Exception);
    }, TaskContinuationOptions.OnlyOnFaulted);
}
```

Usage:
```csharp
SendEmailAsync().FireAndForget(errorHandler => Console.WriteLine(errorHandler.Message));
```

[source](https://steven-giesel.com/blogPost/d38e70b4-6f36-41ff-8011-b0b0d1f54f6e?mkt_tok=NDI2LVFWRC0xMTQAAAGLhZzSgGcDsPAzWAjSBdppkXCTLUs2zvTxoTxmccedVcRwbLzSt3byvnC9lxmYiQ7AZkhYRV5aX9G5gNicORCN2wSATafmQwrNTksujznoTCCPIM9K)


