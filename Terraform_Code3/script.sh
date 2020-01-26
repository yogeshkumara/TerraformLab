echo "testing" > /var/tmp/testfile
yum install -y httpd
echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
systemctl enable httpd
systemctl start httpd

