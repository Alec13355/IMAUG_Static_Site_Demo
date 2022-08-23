param location string = resourceGroup().location

resource staticSite 'Microsoft.Web/staticSites@2022-03-01' = {
  name: 'testSite'
  location: location
  properties: {}
  sku: {
    tier: 'Free'
    name: 'Free'
  }
}

#disable-next-line outputs-should-not-contain-secrets
output deployment_token string = listSecrets(staticSite.id, staticSite.apiVersion).properties.apiKey
