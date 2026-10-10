using '../main.bicep'

param location = 'eastus'
param workloadName = 'tflabprod'
param vnetAddressPrefix = '10.20.0.0/16'
param subnetConfigurations = [
  {
    name: 'web-subnet'
    addressPrefix: '10.20.1.0/24'
  }
  {
    name: 'app-subnet'
    addressPrefix: '10.20.2.0/24'
  }
]
