#!/bin/bash


#based on the following MS article: https://docs.microsoft.com/en-us/azure/iot-edge/how-to-provision-single-device-linux-symmetric?view=iotedge-2020-11&tabs=azure-portal%2Crpios
#deviceConnectionString="123"  #this is the device Connection String from IoT Hub - this could be automated, but it would require Azure CLI be installed
#echo $deviceConnectionString
echo -e "Please Provide the device Connection string from Azure IoT Hub for this device."
read deviceConnectionString


curl https://packages.microsoft.com/config/debian/stretch/multiarch/prod.list > ./microsoft-prod.list
sudo cp ./microsoft-prod.list /etc/apt/sources.list.d/

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo cp ./microsoft.gpg /etc/apt/trusted.gpg.d/

sudo apt-get update; \
  sudo apt-get install moby-engine

sudo apt-get update; \
  sudo apt-get install aziot-edge

#apt list -a aziot-edge aziot-identity-service

sudo iotedge config mp --connection-string $deviceConnectionString

sudo iotedge config apply

