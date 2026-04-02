targetScope = 'subscription'

@description('The region allowed for Apex Cloud Logistics deployments.')
param allowedLocation string = 'southcentralus'

resource regionPolicy 'Microsoft.Authorization/policyAssignments@2024-05-01' = {
  name: 'apex-region-lock'
  properties: {
    displayName: 'Apex Shield: Restrict deployments to South Central US'
    description: 'Enforces cost control by preventing resource creation in expensive non-local regions'
    policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/e56962a6-4747-49cd-b67b-bf8b01975a4c'
    parameters: {
      listOfAllowedLocations: {
        value: {
          allowedLocation
        }
      }
    }
  }
}
