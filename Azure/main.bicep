targetScope = 'resourceGroup'

@description('Azure region used by resources in this deployment')
param location string = resourceGroup().location

@description('Short name used when naming Azure resources')
@minLength(3)
@maxLength(20)
param workloadName string

output deploymentLocation string = location
output deployedWorkloadName string = workloadName
