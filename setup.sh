#!/usr/bin/env bash
# shellcheck disable=SC1090

set -e

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

cp $SCRIPTPATH/assistant.json $HOME

sudo apt-get install -y git build-essential screen

cd $HOME
mkdir -p .config

git clone https://github.com/OwnVoiceAssistant/assistant-sdk-python
git clone --single-branch -b youtube_radio https://github.com/OwnVoiceAssistant/aiyprojects-raspbian voice-recognizer-raspi

make -f $SCRIPTPATH/Makefile

cd $HOME/assistant-sdk-python && source env/bin/activate

make -f $SCRIPTPATH/Makefile sdk

cd $HOME/voice-recognizer-raspi && source env/bin/activate

make -f $SCRIPTPATH/Makefile aiy

sudo reboot
