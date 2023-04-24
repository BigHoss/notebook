---
id: dygvailzhrlpfqjdpc9ll21
title: 1. Delegates - Action and Func
desc: Action and Func delegates in C#
updated: 1677772077641
created: 1672673643315
---


## Abstract

`Action` and `Func` are delegate types provided by the dotnet framework. Delegates are types that represent references to methods. They can be used to pass methods as arguments to other methods.

### Action

is a delegate type that represents a method that does not return a value (like a void). You can use it to perform an operation that does not return a result. For example logging.

Let's create an example:

```csharp
Action<string> printMessage = message => Console.WriteLine(message);
printMessage("Hello, World!");
```

### Func

is a delegate that represents a method that returns a value. You could use a `Func` delegate to represent a method that calculates the sum of two numbers

Let's see it in action:

```csharp
Func<int, int, int> add = (x, y) => x + y;
var result = add(5, 7);
Console.WriteLine(result);  // Output: 12
```
