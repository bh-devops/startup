#!/bin/bash
################# INSTALL HELM ##############################################
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
################ INSTALL KUBECTL ###########################################
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
############### INSTALL PHP 7.3 & IT's UTILS ############################################
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt-get -y install php7.3 wget
#sudo yum -y install php php-cli php-fpm php-mysqlnd php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json wget
############### INSTALL COMPOSER #########################################################
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
HASH="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

echo "PATH=$PATH:/usr/local/bin" >> /etc/environment
##
mkdir -p /tmp/kingmuffin-scripts
git clone https://bitbucket.org/kingmuffin/kingmuffin-scripts.git /tmp/kingmuffin-scripts/
