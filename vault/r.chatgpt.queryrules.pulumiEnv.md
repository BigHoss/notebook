---
id: capmf5524f0gylmrdzqr5o9
title: pulumiEnv
desc: ''
updated: 1687947920332
created: 1687852736924
---

write pulumi c# code to create the following environments:
projectName: neodata
environments: development, testing, testing-external, production
resourceGroupName: rg-{{projectName}}-{{environmentName}}
location: westeurope

azure container registry (name: acr-{{projectName}}) only one instance for all environments

for images:  api.neodata (imageName: api.neodata), api.hekong (imageName: api.hekong):

Azure key vault (name: kv-{{imageName}}-{{environmentName}})
azure service bus (name: sb-{{imageName}}-{{environmentName}})

Azure app configuration (name: ac-{{imageName}}-{{environmentName}}) - connects to key vault, connectionstring of service bus should be stored in app configuration, connectionstring of azure container registry should be stored in app configuration

azure container app (AzureNative.App.ContainerApp) (name: ca-{{imageName}}-{{environmentName}}) - connects to app configuration (using managed identity), service bus (using managed identity), pulls image {{imageName}} from azure container registry (api.neodata connects to both service bus instances, api.hekong connects to its own servicebus instance)



additionaly create a azure devops build pipeline yaml that packs a dotnet webapi as a container and pushes to the azure container registry