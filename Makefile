ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
SDK = ${HOME}/assistant-sdk-python
AIY = ${HOME}/voice-recognizer-raspi
TMP = ${HOME}/tmp

all: setup sample-dep setup-aiy

setup:
	sudo apt-get update
	sudo apt-get install -y python3-dev python3-venv vlc-nox
	mkdir -p ${TMP}
	cd ${SDK} && python3 -m venv env && TMPDIR=${TMP} env/bin/python -m pip install --upgrade pip setuptools

setup-aiy:
	mkdir -p ${TMP}
	cd ${AIY} && python3 -m venv env && TMPDIR=${TMP} env/bin/python -m pip install --upgrade pip setuptools

sample-dep:
	sudo apt-get install -y portaudio19-dev libffi-dev libssl-dev

sdk:
	cd ${SDK} && TMPDIR=${TMP} python -m pip install --upgrade google-assistant-sdk[samples]

aiy:
	cd ${AIY} && TMPDIR=${TMP} scripts/install-deps.sh
	cd ${AIY} && TMPDIR=${TMP} sudo scripts/install-services.sh
	-sudo apt-get update && sudo apt-get install -y raspberrypi-kernel
	cd ${AIY} && TMPDIR=${TMP} sudo scripts/configure-driver.sh
	cd ${AIY} && TMPDIR=${TMP} sudo scripts/install-alsa-config.sh
	cd ${AIY} && TMPDIR=${TMP} pip install -U protobuf

final:
	cd ${AIY} && TMPDIR=${TMP} pip install gpio youtube-dl
	cd ${AIY} && TMPDIR=${TMP} pip install RPi.GPIO psutil

gmusic:
	cd ${AIY} && TMPDIR=${TMP} pip install gmusicapi

clean:
	rm -rf ${HOME}/.cache/voice-recognizer
