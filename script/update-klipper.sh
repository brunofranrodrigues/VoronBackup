#!/bin/bash
sudo service klipper stop

cd /home/pi/klipper/

git pull

# Cria a versao atualizada do firmware para a placa Spider.
rm -rf .config
make clean
#cria o arquivo .config para a Spider
cp .config-Spider .config
make
#cp /home/pi/klipper/out/klipper.bin /home/pi/printer_data/config/firmware.bin
make flash FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_stm32f446xx_4A0045000E51323130373733-if00

# Cria a versao atualizada do firmware para o raspberry PI.
rm -rf .config
make clean
#cria o arquivo .config para a PI
cp .config-Linux .config
make flash FLASH_DEVICE=first

sudo service klipper start
