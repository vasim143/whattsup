#!/bin/bash
sudo apt-get update -y
sudo apt install openjdk-17-jdk openjdk-17-jre -y
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo ufw allow 3000
sudo ufw allow 22
cd /home/ubuntu
git clone https://github.com/CloudTechDevOps/fullstack-employee-application.git
cd fullstack-employee-application/employeemanagement-frontend
npm install
nohup npm start > app.log 2>&1 &
