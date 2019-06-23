# Prerequisites

1. Run setup for [OwnVoiceAssistant Bootstrap](https://github.com/OwnVoiceAssistant/bootstrap)
... The bootstrap will install [OwnVoiceAssistant Bluetooth Admin](https://github.com/OwnVoiceAssistant/raspi-btadmin)
... This will allow you to setup wifi using BT without a computer
... It will also enable ssh daemon, so that you can ssh into the Pi as well.
2. a. Setup Wifi using Bluetooth. This method requires a Bluetooth terminal app on a mobile smart phone.
... Download a bluetooth terminal app on your phone
... Scan for a BT device named raspberry
... Pair with the raspberry 
... Connect to the device
... The wifi command is like wifi <password> <country_code> <ssid> <password>
... Send the command like: wifi raspberry US MY_SSID MY_PASSWORD
... Raspberry is the default password, MY_SSID and MY_PASSWORD should be changed according to your wifi router settings.
2. b. Setup wifi using ssh. This is only avalable if you have ethernet, and can ssh into the Pi from another computer.
... Once logged in, run the command: ./bin/wifi <password> <country_code> <ssid> <password>
2. c. Setup wifi using keyboard. This is only available if you have monitor and keyboard attached.
... Once logged in, run the command: ./bin/wifi <password> <country_code> <ssid> <password>
3. Once wifi is setup, you should use ssh to login to the Pi, and harden the Pi.

# Installation

1. git clone this repository

