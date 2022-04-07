#!/bin/bash


#based on the following MS article: https://docs.microsoft.com/en-us/azure/iot-edge/how-to-provision-single-device-linux-symmetric?view=iotedge-2020-11&tabs=azure-portal%2Crpios
# deviceConnectionString="123"  #this is the device Connection String from IoT Hub - this could be automated, but it would require Azure CLI be installed
# echo $deviceConnectionString

echo -e "Please Provide the device Connection string from Azure IoT Hub for this device."
read deviceConnectionString

wget https://packages.microsoft.com/config/ubuntu/18.04/multiarch/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb


sudo apt-get update; \
  sudo apt-get install moby-engine


sudo apt-get update; \
sudo apt-get install aziot-edge

#apt list -a aziot-edge aziot-identity-service

sudo iotedge config mp --connection-string $deviceConnectionString

sudo iotedge config apply