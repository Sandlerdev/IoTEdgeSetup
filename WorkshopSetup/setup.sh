#!/bin/bash

 subscription="az2p-0280-ITDEnterpriseIntegration-ITD-POWER CONTROL BUSINESS"
 iothubName="ar4IoTHub"
 device1Name="PowerFlexEdgetest"
 device2Name="KinetixEdge"
 device3Name="IO_LinkEdge"
 device4Name="SensorEdge"

 

 #Login to Azure
 az login

#Set Subscription
az account set --subscription $subscription
az iot hub device-identity create -n $iothubName -d $device1Name --edge-enabled
az iot hub device-identity create -n $iothubName -d $device2Name --edge-enabled
az iot hub device-identity create -n $iothubName -d $device3Name --edge-enabled
az iot hub device-identity create -n $iothubName -d $device4Name --edge-enabled

connectionString=$(az iot hub device-identity connection-string show --device-id "$device1Name" --hub-name "$iothubName" --query connectionString)


sed -i 's/"constring"/'$connectionString'/' PowerflexedgeDeploy.json

#Create Deployments
depName=$device1Name"Deployment" 

az iot edge deployment create -d $depName -n $iothubName --content ./PowerflexedgeDeploy.json --target-condition "deviceid='$device1Name'" --priority 3

depName=$device2Name"Deployment" 

az iot edge deployment create -d $depName -n $iothubName --content ./KinetixEdgeDeploy.json --target-condition "deviceid='$device2Name'" --priority 4

depName=$device3Name"Deployment" 

az iot edge deployment create -d $depName -n $iothubName --content ./IoLinkEdgeDeploy.json --target-condition "deviceid='$device3Name'" --priority 3

