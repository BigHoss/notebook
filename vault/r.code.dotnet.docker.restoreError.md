---
id: i9yhuqyaofx3qp5xc6ur8wy
title: restoreError
desc: ''
updated: 1682342785645
created: 1682342619595
---

## problem

when using a private registry for your nuget packages you might get the following error:

![](/assets/images/2023-04-24-15-25-03.png)



## solution

Based on my understanding you have the following scenario:

a .NET 6 application with some references to nuget packages
some nuget packages are taken from the usual Nuget public repository, some others are taken from a private nuget feed
you are distributing your application via a docker image and during the docker build process you want to run a dotnet restore command targeting one of your csproj file
the dotnet restore command fails because the dotnet cli is unable to talk with your private nuget feed
I encountered the very same situation with the project I'm working on. We have a private Nuget feed hosted in Azure Devops and we too had some troubles figuring out how to solve this.

First of all, let's clarify the root cause of the problem. You did the right thing veryfying that you are able to reach the nuget feed from your build machine, via the curl command you mentioned. What is actually failing is the authentication between your build machine and the private nuget feed.

The first thing you need is a personal access token with read permissions for your nuget feed. You can follow this guide to create the personal access token you need.

Once you have the token, you need to provide it to the dotnet cli. There are several ways to do so, I'm going to explain the one that worked for us.

Instead of adding the nuget source to the nuget.config file, we registers it via a cli command. I'm quite sure there is a way to do exactly the same thing via the nuget.config file (see here for more details).

This is the cli command we use inside of our docker file:

```bash
RUN dotnet nuget add source https://foo.bar.com/something/nuget/v3/index.json -u "whatever" -p "my-personal-access-token" --store-password-in-clear-text --valid-authentication-types "basic"
```
Notice that:

https://foo.bar.com/something/nuget/v3/index.json is the absolute URL pointing to the index of your private nuget feed
the username can be whatever you like. You do need to provide a value, but I didn't notice any difference even putting there a random string like whatever
the fictious value my-personal-access-token must be substituted with the personal access token you have created as a first step
Here you can find the full reference for the dotnet nuget add source command.

After registering this source with the dotnet cli, you will be able to run your dotnet restore command with no errors.

Hope this helps!

[source](https://stackoverflow.com/a/75262984)