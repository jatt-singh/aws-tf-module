#!/bin/bash
yum update -y
yum install -y nginx postgresql15
systemctl enable nginx
systemctl start nginx

# Health check endpoint
cat <<EOF > /usr/share/nginx/html/index.html
<!DOCTYPE html>
<html><body><h1>OK - $(hostname)</h1></body></html>
EOF

systemctl restart nginx
