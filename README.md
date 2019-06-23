# Prerequisites

## Bootstrap ##
  Run setup for [OwnVoiceAssistant Bootstrap](https://github.com/OwnVoiceAssistant/bootstrap) by following the setup instructions.

  The bootstrap will install [OwnVoiceAssistant Bluetooth Admin](https://github.com/OwnVoiceAssistant/raspi-btadmin), and install enable ssh to start automatically.

## Setup wifi ##

### Using OwnVoiceAssistant Bluetooth Admin ###
  This method allows you to setup wifi using BT without a computer.
  1. Download a Bluetooth terminal app on to your mobile smart phone
  2. Scan for a BT device named raspberry
  3. Pair with the raspberry
  4. Connect to the device
  5. Enable wifi by sending commands inside the Bluetooth terminal app:
```
wifi <password> <country_code> <ssid> <password>

example:
wifi raspberry US MY_SSID MY_PASSWORD

where raspberry is the default password, MY_SSID and MY_PASSWORD should be changed according to your wifi router settings.
```

### Using ssh or with a keyboard and monitor ###
```
./bin/wifi <password> <country_code> <ssid> <password>

example:
./bin/wifi raspberry US MY_SSID MY_PASSWORD

where raspberry is the default password, MY_SSID and MY_PASSWORD should be changed according to your wifi router settings.
```

## Harden the system ##

  Once wifi is setup, you should use ssh to login to the Pi, and harden the Pi. I recommend the following:

  1. Change the password for user pi.
```
passwd
```
  The default password is raspberry

  2. Setup ssh key, and put your public key inside .ssh/authorized_keys.

  3. If #2 is done, you should disable password login using ssh.
```
sudo vi /etc/ssh/sshd_config

change line:
#PasswordAuthentication yes
to
PasswordAuthentication no
```

# Installation

1. git clone this repository
```
cd $HOME
git clone https://github.com/OwnVoiceAssistant/voice-assistant-build
```
2. Run setup
```
cd voice-assistant-build
./setup.sh
```

  At the end, this command will restart the system.
3. ./finalize.sh
```
./finalize.sh
sudo reboot
```

  This will authorize you to the OwnVoiceAssistant project on Google. Please follow the prompt, to obtain the correct authorization code. Alternatively, you can setup you own project to avoid running into Google Assistant API quota limitations. See the section below on how to do this.

# Create your own Google Assistant project.

  Google Assistant API is used to translate the voice inputs, and converts them into text. To avoid constant background recording, voice input is starts when the OwnVoiceAssistant trigger button is depressed. And the recording stops after the command has been spoken.

  Currently, the Google Assistant API quota is limited at 500 requests per day, and 60 requests per minute. Unfortunately, we do not have the budget to increase our own API quota.

  To obtain your own Google Assistant API credential, please follow the steps outlined here: https://aiyprojects.withgoogle.com/voice/#google-assistant--get-credentials . Make sure you replace the $HOME/assistant.json file with you own credential. Run the following to regenerate authorization information:

```
cd $HOME/voice-assistant-build
./regenerate.sh
```

  We recommend creating an anonymous google account for your Google Assistant credential. If you have any questions or concerns, feel free to contact us at support at ownvoiceassistant.com .

