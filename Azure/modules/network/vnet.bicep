@description('Name of the virtual network')
param name string

@description('Azure region in which to deploy the virtual network')
param location string

@description('Address prefix assigned to the virtual network')
param addressPrefix string

@description('Subnets created inside the virtual network')
param subnetConfigurations array

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2023-11-01' = {
  name: name
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [
      for subnet in subnetConfigurations: {
        name: subnet.name
        properties: {
          addressPrefix: subnet.addressPrefix
        }
      }
    ]
  }
}

output vnetId string = virtualNetwork.id
output vnetName string = virtualNetwork.name

output subnetIds array = [
  for subnet in subnetConfigurations: resourceId(
    'Microsoft.Network/virtualNetworks/subnets',
    virtualNetwork.name,
    subnet.name
  )
]
