@description('Specifies the location for resources.')
param location string = 'West US'

resource staticSite 'Microsoft.Web/staticSites@2023-01-01' = {
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
