#!/bin/bash
set -e

yum update -y
if ! command -v httpd >/dev/null 2>&1; then
  yum install -y httpd
fi
systemctl enable httpd
mkdir -p /var/www/html
