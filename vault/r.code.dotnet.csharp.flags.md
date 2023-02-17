---
id: mhkaicilxkzzk46nm9onc7u
title: Flags
desc: ''
updated: 1676448304570
created: 1676448304570
---


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