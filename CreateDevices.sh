#!/bin/bash

 subscription="az2p-0280-ITDEnterpriseIntegration-ITD-POWER CONTROL BUSINESS"
 iothubName="ar4IoTHub"
 device1Name="PowerFlexEdge"
 device2Name="KinetixEdge"
 device3Name="IO_LinkEdge"
 device4Name="SensorEdge"

 #Login to Azure
 az login

 #Set Subscription
#echo %subscription%
az account set --subscription $subscription
#Create Devices

az iot hub device-identity create -n $iothubName -d $device1Name --edge-enabled
az iot hub device-identity create -n $iothubName -d $device2Name --edge-enabled
az iot hub device-identity create -n $iothubName -d $device3Name --edge-enabled
az iot hub device-identity create -n $iothubName -d $device4Name --edge-enabled