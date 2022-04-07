# Bash Scripts to simplify the deployment of Azure IoT Edge

This repo contains three simple scripts to better automate the deployment of Azure IoT Edge on various Linux operating systems.

All three scripts are based on the commands listed in the following MS Article: 
https://docs.microsoft.com/en-us/azure/iot-edge/how-to-provision-single-device-linux-symmetric?view=iotedge-2020-11&tabs=azure-portal%2Cubuntu

and simply batch the commands found in the above article into a single shell script.  

The script will prompt users for the device connection string. This can be found in the Azure Portal under IoT Edge Devices or via Azure CLI if creating devices programatically. 

## Using these scripts

Download the appropriate script for your operating system. This can be done via the following wget commands:

### Raspberry PI

```bash
wget https://raw.githubusercontent.com/Sandlerdev/IoTEdgeSetup/master/IoTEdgeSetup_PI.sh
```

### Ubuntu 18.x

```bash
wget https://raw.githubusercontent.com/Sandlerdev/IoTEdgeSetup/master/ioTEdgeSetup_ubuntu18.sh
```

### Ubuntu 20.x

```bash
wget https://raw.githubusercontent.com/Sandlerdev/IoTEdgeSetup/master/ioTEdgeSetup_ubuntu20.sh
```

**Executing the script(s):**

```bash
sudo ./<script name>
```

At this point you will recieve the following prompt:

```bash

"Please Provide the device Connection string from Azure IoT Hub for this device."

```

Copy the connection string from IoT Hub and paste it in the command prompt and press enter. 

Provided no issues are encountered the configuration should proceed and complete the configuration.