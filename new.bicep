param location string = resourceGroup().location


resource staticSite 'Microsoft.Web/staticSites@2022-09-01' = {
  location:location
  name:'testSite'
}

#disable-next-line outputs-should-not-contain-secrets
output deployment_token string = listSecrets(staticSite.id, staticSite.apiVersion).properties.apiKey
