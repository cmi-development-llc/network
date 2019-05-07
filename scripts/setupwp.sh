sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
sudo yum install -y httpd mariadb-server
sudo systemctl start httpd
sudo systemctl enable httpd
sudo usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo mysql_secure_installation

sudo yum -y install gcc libstdc++-devel gcc-c++ fuse fuse-devel curl-devel libxml2-devel mailcap git automake make
sudo yum -y install openssl-devel # See (*2)
cd ~
git clone https://github.com/s3fs-fuse/s3fs-fuse
cd s3fs-fuse/
./autogen.sh
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
./configure --prefix=/usr --with-openssl # See (*1)
make
sudo make install

 /usr/bin/s3fs cmidevelopment.llc /var/www/html_static -o use_path_request_style,iam_role,allow_other


 zip -r filename.zip html
 mysqldump -uroot wordpress > mysqlbackup.sql