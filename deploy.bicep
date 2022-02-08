resource staticSite 'Microsoft.Web/staticSites@2020-12-01' = {
  name: 'testSite'
  location: resourceGroup().location
  properties: {}
  sku: {
    tier: 'Free'
    name: 'Free'
  }
}

#disable-next-line outputs-should-not-contain-secrets
output deployment_token string = listSecrets(staticSite.id, staticSite.apiVersion).properties.apiKey
