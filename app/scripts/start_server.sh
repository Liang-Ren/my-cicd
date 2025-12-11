#!/bin/bash
set -e

# Deploy new content already copied by CodeDeploy to /var/www/html
chown -R apache:apache /var/www/html || true
systemctl restart httpd
