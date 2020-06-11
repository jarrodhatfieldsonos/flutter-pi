#! /bin/bash

sudo apt install git libgles2-mesa-dev libdrm-dev libgbm-dev gpiod libgpiod-dev cmake

sudo apt install ttf-mscorefonts-installer fontconfig
sudo fc-cache

usermod -a -G render pi