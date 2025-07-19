#!/bin/bash
sudo apt-get update -y
sudo apt install openjdk-17-jdk openjdk-17-jre -y
sudo apt install maven -y
sudo apt install mysql-client -y
sudo ufw allow 8080
sudo ufw allow 22
# Clone backend repo and start backend (replace <repo_url> and customize as needed)
cd /home/ubuntu
git clone https://github.com/CloudTechDevOps/fullstack-employee-application.git
cd fullstack-employee-application/employeemanagmentbackend
# Here you can add commands to configure application.properties or run your app
