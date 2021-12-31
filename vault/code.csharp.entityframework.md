---
id: uWvhiaqoh9Nt20wIzx2on
title: Entityframework
desc: ''
updated: 1640939078232
created: 1640939075525
---
# Entity Framework stuff

## Start
.net 4.7
Ef core

Install:
Microsoft.entityframeworkcore.sqlserver
Microsoft.entityframeworkcore.Tools

From existing Db:
Scaffold-DbContext "Server=%SQLINSTANCE%;Database=Manager;Trusted_Connection=True;" Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models

Add migration:
Add-Migration Init

Add to .csproj
```
<AutoGenerateBindingRedirects>true</AutoGenerateBindingRedirects>
<GenerateBindingRedirectsOutputType>true</GenerateBindingRedirectsOutputType>
```


## Why EF CodeFirst
### 1. Less cruft, less bloat
Using an existing database to generate a .edmx model file and the associated code models results in a giant pile of auto generated code. You’re implored never to touch these generated files lest you break something, or your changes get overwritten on the next generation. The context and initializer are jammed together in this mess as well. When you need to add functionality to your generated models, like a calculated read only property, you need to extend the model class. This ends up being a requirement for almost every model and you end up with an extension for everything.
With code first your hand coded models become your database. The exact files that you’re building are what generate the database design. There are no additional files and there is no need to create a class extension when you want to add properties or whatever else that the database doesn't need to know about. You can just add them into the same class as long as you follow the proper syntax. Heck, you can even generate a Model.edmx file to visualize your code if you want.
### 2. Greater Control
When you go DB first, you’re at the mercy of what gets generated for your models for use in your application. Occasionally the naming convention is undesirable. Sometimes the relationships and associations aren't quite what you want. Other times non transient relationships with lazy loading wreak havoc on your API responses.
While there is almost always a solution for model generation problems you might run into, going code first gives you complete and fine grained control from the get go. You can control every aspect of both your code models and your database design from the comfort of your business object. You can precisely specify relationships, constraints, and associations. You can simultaneously set property character limits and database column sizes. You can specify which related collections are to be eager loaded, or not be serialized at all. In short, you are responsible for more stuff but you’re in full control of your app design.

### 3. Database Version Control
This is a big one. Versioning databases is hard, but with code first and code first migrations, it’s much more effective. Because your database schema is fully based on your code models, by version controlling your source code you're helping to version your database. You’re responsible for controlling your context initialization which can help you do things like seed fixed business data. You’re also responsible for creating code first migrations.
When you first enable migrations, a configuration class and an initial migration are generated. The initial migration is your current schema or your baseline v1.0. From that point on you will add migrations which are timestamped and labeled with a descriptor to help with ordering of versions. When you call add-migration from the package manager, a new migration file will be generated containing everything that has changed in your code model automatically in both an UP() and DOWN() function. The UP function applies the changes to the database, the DOWN function removes those same changes in the event you want to rollback. What’s more, you can edit these migration files to add additional changes such as new views, indexes, stored procedures, and whatever else. They will become a true versioning system for your database schema.

[Soruce](https://stackoverflow.com/questions/5446316/code-first-vs-model-database-first)


## Startup Performance increase
[Fusonic Blogpost](https://www.fusonic.net/developers/2014/07/09/3-steps-for-fast-entity-framework-6-1-code-first-startup-performance/)



## Update ef tools
```
dotnet tool update --global dotnet-ef
```

