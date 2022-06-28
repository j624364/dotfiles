#!/bin/bash

~/Scripts/ProxyOff.sh

sudo systemctl start cntlm.service
echo 'export http_proxy=http://127.0.0.1:3128' | sudo tee -a /etc/profile
echo 'export https_proxy=http://127.0.0.1:3128' | sudo tee -a /etc/profile
echo 'export ftp_proxy=http://127.0.0.1:3128' | sudo tee -a /etc/profile

