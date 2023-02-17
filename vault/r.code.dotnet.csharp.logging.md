---
id: 9ivcycwt5im40wz3icfhwzp
title: Logging
desc: ''
updated: 1676448890304
created: 1676448537794
source: https://docs.datalust.co/docs/microsoft-extensions-logging
---
## Centralized logging

[Datalust Seq](dataluse.co)

## Logging in unit tests

### logging with seq

```csharp
services.AddLogging(loggingBuilder \=> { loggingBuilder.AddSeq(); });
```

### logging with outputHelper and iLogger

install nuget package

```pwsh
dotnet add package MartinCostello.Logging.XUnit
```

```csharp
public class ExampleTest
{
    public ExampleTest(ITestOutputHelper outputHelper)
    {
        OutputHelper = outputHelper;
    }

    private ITestOutputHelper OutputHelper { get; }

    [Fact]
    public void This_Is_An_Example_Test()
    {
        // Arrange
        var services = new ServiceCollection()
            .AddLogging((builder) => builder.AddXUnit(OutputHelper))
            .AddSingleton<Calculator>();

        var calculator = services
            .BuildServiceProvider()
            .GetRequiredService<Calculator>();

        // Act
        int actual = calculator.Sum(1, 2);

        // Assert
        Assert.AreEqual(3, actual);
    }
}
```
