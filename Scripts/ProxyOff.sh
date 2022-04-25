#!/bin/bash

sudo systemctl stop cntlm.service

sudo sed -i.bak "/proxy/d" /etc/environment

