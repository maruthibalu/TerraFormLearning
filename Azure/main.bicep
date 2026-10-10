targetScope = 'resourceGroup'

@description('Azure region used by resources in this deployment')
param location string = resourceGroup().location

@description('Short name used when naming Azure resources')
@minLength(3)
@maxLength(20)
param workloadName string

@description('Address prefix assigned to the virtual network.')
param vnetAddressPrefix string

@description('Subnets created inside the virtual network')
param subnetConfigurations array

module virtualNetwork './modules/network/vnet.bicep' = {
  name: 'virtual-network'
  params: {
    name: '${workloadName}-vnet'
    location: location
    addressPrefix: vnetAddressPrefix
    subnetConfigurations: subnetConfigurations
  }
}

output deploymentLocation string = location
output deployedWorkloadName string = workloadName
output vnetId string = virtualNetwork.outputs.vnetId
output vnetName string = virtualNetwork.outputs.vnetName
output subnetIds array = virtualNetwork.outputs.subnetIds
