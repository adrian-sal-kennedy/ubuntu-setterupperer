#!/bin/bash
sudo add-apt-repository ppa:yannubuntu/boot-repair
sudo apt install boot-repair && sudo add-apt-repository --remove ppa:yannubuntu/boot-repair
boot-repair 