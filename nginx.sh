#!/bin/bash

# Install nginx
yum install -y nginx

# Start and enable nginx
systemctl start nginx
systemctl enable nginx

# Create a basic HTML file
echo "<h1> Terraform NGINX Deployment Successful </h1>" > /usr/share/nginx/html/index.html
