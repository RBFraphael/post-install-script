#!/bin/bash

# DEB Packages URLs - CHANGE TO LATEST BEFORE RUN

DEB_URL_DOCKER="https://desktop.docker.com/linux/main/amd64/136059/docker-desktop-4.27.1-amd64.deb"
DEB_URL_VBOX="https://download.virtualbox.org/virtualbox/7.0.14/virtualbox-7.0_7.0.14-161095~Ubuntu~jammy_amd64.deb"
VBOX_EXT_PACK="https://download.virtualbox.org/virtualbox/7.0.14/Oracle_VM_VirtualBox_Extension_Pack-7.0.14.vbox-extpack"
DEB_URL_DRAWIO="https://github.com/jgraph/drawio-desktop/releases/download/v23.0.2/drawio-amd64-23.0.2.deb"
ANDROID_STUDIO_PACKAGE="https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2023.1.1.28/android-studio-2023.1.1.28-linux.tar.gz"
GO_PACKAGE="https://go.dev/dl/go1.21.6.linux-amd64.tar.gz"

# That's it! Stop editing (unless you know what you're doing and it's risks)

C_YELLOW=`tput setaf 220`
C_GREEN=`tput setaf 42`
C_RESET=`tput init`

echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 1. Update cache and packages \n \
----------------------------------------------- \n \
${C_RESET}"
# Update cache and packages
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 2. Install required packages \n \
----------------------------------------------- \n \
${C_RESET}"
# Install required tools
sudo apt install ca-certificates git gnupg -y



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 3. Add PPA repositories \n \
----------------------------------------------- \n \
${C_RESET}"
# Add repositories
sudo add-apt-repository ppa:ondrej/apache2 -y
sudo add-apt-repository ppa:ondrej/php -y
sudo add-apt-repository ppa:libreoffice/ppa -y
sudo add-apt-repository ppa:papirus/papirus -y
sudo add-apt-repository ppa:xtradeb/apps -y



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 4. Add UnityHub repository \n \
----------------------------------------------- \n \
${C_RESET}"
# Add Unity Hub repository
wget -qO - https://hub.unity3d.com/linux/keys/public | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/Unity_Technologies_ApS.gpg > /dev/null
sudo sh -c 'echo "deb [signedby=/etc/apt/trusted.gpg.d/Unity_Technologies_ApS.gpg] https://hub.unity3d.com/linux/repos/deb stable main" > /etc/apt/sources.list.d/unityhub.list'



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 5. Add Mono repository \n \
----------------------------------------------- \n \
${C_RESET}"
# Add Mono repository
sudo gpg --homedir /tmp --no-default-keyring --keyring /usr/share/keyrings/mono-official-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb [signed-by=/usr/share/keyrings/mono-official-archive-keyring.gpg] https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 6. Add Docker repository \n \
----------------------------------------------- \n \
${C_RESET}"
# Add Docker repository
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu jammy stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 7. Add AnyDesk repository \n \
----------------------------------------------- \n \
${C_RESET}"
# Add AnyDesk repository
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 8. Prevent DotNet from archive.ubuntu.com \n \
----------------------------------------------- \n \
${C_RESET}"
# Prevent dotnet from Ubuntu repositories
sudo touch /etc/apt/preferences.d/dotnet.pref
echo "Package: dotnet* aspnet* netstandard*" | sudo tee -a /etc/apt/preferences.d/dotnet.pref > /dev/null
echo "Pin: origin \"archive.ubuntu.com\"" | sudo tee -a /etc/apt/preferences.d/dotnet.pref > /dev/null
echo "Pin-Priority: -10" | sudo tee -a /etc/apt/preferences.d/dotnet.pref > /dev/null



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 9. Update cache and packages \n \
----------------------------------------------- \n \
${C_RESET}"
# Update cache and packages
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 10. Install Apache, PHP (5.6, 7.0, 7.2, 7.4, 8.0, 8.2 and 8.3) and MariaDB \n \
----------------------------------------------- \n \
${C_RESET}"
# Install Web Server
sudo apt-get install apache2 libapache2-mod-fcgid \
        php5.6-fpm php5.6-bz2 php5.6-curl php5.6-gd php5.6-geoip php5.6-http php5.6-imap php5.6-intl php5.6-json php5.6-ldap php5.6-mbstring php5.6-mongodb php5.6-mysql php5.6-pgsql php5.6-raphf php5.6-redis php5.6-smbclient php5.6-soap php5.6-sqlite3 php5.6-uploadprogress php5.6-xdebug php5.6-xml php5.6-yaml php5.6-zip \
        php7.0-fpm php7.0-bz2 php7.0-curl php7.0-gd php7.0-geoip php7.0-http php7.0-imap php7.0-intl php7.0-json php7.0-ldap php7.0-mbstring php7.0-mongodb php7.0-mysql php7.0-pgsql php7.0-raphf php7.0-redis php7.0-smbclient php7.0-soap php7.0-sqlite3 php7.0-uploadprogress php7.0-xdebug php7.0-xml php7.0-yaml php7.0-zip \
        php7.2-fpm php7.2-bz2 php7.2-curl php7.2-gd php7.2-geoip php7.2-http php7.2-imap php7.2-intl php7.2-json php7.2-ldap php7.2-mbstring php7.2-mongodb php7.2-mysql php7.2-pgsql php7.2-raphf php7.2-redis php7.2-smbclient php7.2-soap php7.2-sqlite3 php7.2-uploadprogress php7.2-xdebug php7.2-xml php7.2-yaml php7.2-zip \
        php7.4-fpm php7.4-bz2 php7.4-curl php7.4-gd php7.4-geoip php7.4-http php7.4-imap php7.4-intl php7.4-json php7.4-ldap php7.4-mbstring php7.4-mongodb php7.4-mysql php7.4-pgsql php7.4-raphf php7.4-redis php7.4-smbclient php7.4-soap php7.4-sqlite3 php7.4-uploadprogress php7.4-xdebug php7.4-xml php7.4-yaml php7.4-zip \
        php8.0-fpm php8.0-bz2 php8.0-curl php8.0-gd php8.0-http php8.0-imap php8.0-intl php8.0-ldap php8.0-mbstring php8.0-mongodb php8.0-mysql php8.0-pgsql php8.0-raphf php8.0-redis php8.0-smbclient php8.0-soap php8.0-sqlite3 php8.0-uploadprogress php8.0-xdebug php8.0-xml php8.0-yaml php8.0-zip \
        php8.2-fpm php8.2-bz2 php8.2-curl php8.2-gd php8.2-http php8.2-imap php8.2-intl php8.2-ldap php8.2-mbstring php8.2-mongodb php8.2-mysql php8.2-pgsql php8.2-raphf php8.2-redis php8.2-smbclient php8.2-soap php8.2-sqlite3 php8.2-uploadprogress php8.2-xdebug php8.2-xml php8.2-yaml php8.2-zip \
        php8.3-fpm php8.3-bz2 php8.3-curl php8.3-gd php8.3-http php8.3-imap php8.3-intl php8.3-ldap php8.3-mbstring php8.3-mongodb php8.3-mysql php8.3-pgsql php8.3-raphf php8.3-redis php8.3-smbclient php8.3-soap php8.3-sqlite3 php8.3-uploadprogress php8.3-xdebug php8.3-xml php8.3-yaml php8.3-zip \
        mariadb-server -y



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 11. Install Docker \n \
----------------------------------------------- \n \
${C_RESET}"
# Install Docker
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 12. Install Mono \n \
----------------------------------------------- \n \
${C_RESET}"
# Install Mono
sudo apt-get install mono-devel -y



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 13. Install UnityHub \n \
----------------------------------------------- \n \
${C_RESET}"
# Install Unity Hub
sudo apt-get install unityhub -y



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 14. Install AnyDesk \n \
----------------------------------------------- \n \
${C_RESET}"
# Install AnyDesk
sudo apt install anydesk -y



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 15. Install other packages \n \
----------------------------------------------- \n \
${C_RESET}"
# Install other applications
sudo apt-get install antimicro cpu-x okular cheese papirus-icon-theme hardinfo simplescreenrecorder stacer vlc resolvconf filezilla filezilla-theme-papirus samba smbclient remmina remmina-plugin-rdp remmina-plugin-vnc ttf-* fonts-* dconf-editor openssh-server -y



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 16. Install NVM \n \
----------------------------------------------- \n \
${C_RESET}"
# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 17. Install Flatpak applications \n \
----------------------------------------------- \n \
${C_RESET}"
# Install Flatpak applications
flatpak install flathub com.spotify.Client -y
flatpak install flathub com.slack.Slack -y
flatpak install flathub org.blender.Blender -y
flatpak install flathub org.kde.krita -y
flatpak install flathub org.inkscape.Inkscape -y
flatpak install flathub org.gimp.GIMP -y
flatpak install flathub com.usebottles.bottles -y
flatpak install flathub com.github.tchx84.Flatseal -y
flatpak install flathub com.valvesoftware.Steam -y
flatpak install flathub com.getpostman.Postman -y
flatpak install flathub org.gnome.meld -y
flatpak install flathub org.sqlitebrowser.sqlitebrowser -y
flatpak install flathub org.telegram.desktop -y
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub com.github.IsmaelMartinez.teams_for_linux -y
flatpak install flathub com.todoist.Todoist -y
flatpak install flathub com.authy.Authy -y
flatpak install flathub org.flameshot.Flameshot -y
flatpak install flathub io.github.Figma_Linux.figma_linux -y


echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 18. Create Home directories \n \
----------------------------------------------- \n \
${C_RESET}"
# Setup Home dir
mkdir ~/Applications
mkdir ~/bin
mkdir ~/Projects
mkdir ~/Git
mkdir ~/Web
mkdir ~/deb_temp
mkdir ~/.themes


echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 19. Setup Apache \n \
----------------------------------------------- \n \
${C_RESET}"
# Setup Apache
sudo a2dismod php*
sudo a2enmod alias vhost_alias headers rewrite ssl fcgid proxy_fcgi
sudo a2enconf php5.6-fpm php7.0-fpm php7.2-fpm php7.4-fpm php8.0-fpm php8.2-fpm php8.3-fpm
sudo service apache2 restart

echo -e "\
export PHP56=\"proxy:unix:/run/php/php5.6-fpm.sock|fcgi://localhost\" \n \
export PHP70=\"proxy:unix:/run/php/php7.0-fpm.sock|fcgi://localhost\" \n \
export PHP72=\"proxy:unix:/run/php/php7.2-fpm.sock|fcgi://localhost\" \n \
export PHP74=\"proxy:unix:/run/php/php7.4-fpm.sock|fcgi://localhost\" \n \
export PHP80=\"proxy:unix:/run/php/php8.0-fpm.sock|fcgi://localhost\" \n \
export PHP82=\"proxy:unix:/run/php/php8.2-fpm.sock|fcgi://localhost\" \n \
export PHP83=\"proxy:unix:/run/php/php8.3-fpm.sock|fcgi://localhost\" \n \
" | sudo tee -a /etc/apache2/envvars > /dev/null

sudo sed -i "s/www-data/$USER/g" /etc/apache2/envvars

sudo sed -i "s/www-data/$USER/g" /etc/php/5.6/fpm/pool.d/www.conf
sudo sed -i "s/www-data/$USER/g" /etc/php/7.0/fpm/pool.d/www.conf
sudo sed -i "s/www-data/$USER/g" /etc/php/7.2/fpm/pool.d/www.conf
sudo sed -i "s/www-data/$USER/g" /etc/php/7.4/fpm/pool.d/www.conf
sudo sed -i "s/www-data/$USER/g" /etc/php/8.0/fpm/pool.d/www.conf
sudo sed -i "s/www-data/$USER/g" /etc/php/8.2/fpm/pool.d/www.conf
sudo sed -i "s/www-data/$USER/g" /etc/php/8.3/fpm/pool.d/www.conf

sudo sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 10G/g" /etc/php/5.6/fpm/php.ini
sudo sed -i "s/post_max_size = 8M/post_max_size = 10G/g" /etc/php/5.6/fpm/php.ini
sudo sed -i "s/max_execution_time = 30/max_execution_time = 300/g" /etc/php/5.6/fpm/php.ini

sudo sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 10G/g" /etc/php/7.0/fpm/php.ini
sudo sed -i "s/post_max_size = 8M/post_max_size = 10G/g" /etc/php/7.0/fpm/php.ini
sudo sed -i "s/max_execution_time = 30/max_execution_time = 300/g" /etc/php/7.0/fpm/php.ini

sudo sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 10G/g" /etc/php/7.2/fpm/php.ini
sudo sed -i "s/post_max_size = 8M/post_max_size = 10G/g" /etc/php/7.2/fpm/php.ini
sudo sed -i "s/max_execution_time = 30/max_execution_time = 300/g" /etc/php/7.2/fpm/php.ini

sudo sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 10G/g" /etc/php/7.4/fpm/php.ini
sudo sed -i "s/post_max_size = 8M/post_max_size = 10G/g" /etc/php/7.4/fpm/php.ini
sudo sed -i "s/max_execution_time = 30/max_execution_time = 300/g" /etc/php/7.4/fpm/php.ini

sudo sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 10G/g" /etc/php/8.0/fpm/php.ini
sudo sed -i "s/post_max_size = 8M/post_max_size = 10G/g" /etc/php/8.0/fpm/php.ini
sudo sed -i "s/max_execution_time = 30/max_execution_time = 300/g" /etc/php/8.0/fpm/php.ini

sudo sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 10G/g" /etc/php/8.2/fpm/php.ini
sudo sed -i "s/post_max_size = 8M/post_max_size = 10G/g" /etc/php/8.2/fpm/php.ini
sudo sed -i "s/max_execution_time = 30/max_execution_time = 300/g" /etc/php/8.2/fpm/php.ini

sudo sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 10G/g" /etc/php/8.3/fpm/php.ini
sudo sed -i "s/post_max_size = 8M/post_max_size = 10G/g" /etc/php/8.3/fpm/php.ini
sudo sed -i "s/max_execution_time = 30/max_execution_time = 300/g" /etc/php/8.3/fpm/php.ini

echo -e "\
<FilesMatch \\.php$>
    SetHandler \${PHP83}
</FilesMatch>

AccessFileName .htaccess .phpv

<Directory $HOME/Web> \n \
	Options Indexes FollowSymLinks \n \
	AllowOverride All \n \
	Require all granted \n \
</Directory> \n \
<VirtualHost *:80> \n \
	ServerName local.host \n \
	DocumentRoot $HOME/Web \n \
	ErrorLog ${APACHE_LOG_DIR}/error.log \n \
	CustomLog ${APACHE_LOG_DIR}/access.log combined \n \
</VirtualHost> \n \
<VirtualHost *:80> \n \
    ServerAlias *.*.*.local.host \n \
    VirtualDocumentRoot $HOME/Web/%3/%2/%1 \n \
	ErrorLog ${APACHE_LOG_DIR}/error.log \n \
	CustomLog ${APACHE_LOG_DIR}/access.log combined \n \
</VirtualHost> \n \
<VirtualHost *:80> \n \
    ServerAlias *.*.local.host \n \
    VirtualDocumentRoot $HOME/Web/%2/%1 \n \
    ErrorLog ${APACHE_LOG_DIR}/error.log \n \
    CustomLog ${APACHE_LOG_DIR}/access.log combined \n \
</VirtualHost> \n \
<VirtualHost *:80> \n \
    ServerAlias *.local.host \n \
    VirtualDocumentRoot $HOME/Web/%1 \n \
    ErrorLog ${APACHE_LOG_DIR}/error.log \n \
    CustomLog ${APACHE_LOG_DIR}/access.log combined \n \
</VirtualHost> \n \
" | sudo tee /etc/apache2/sites-available/localhost.conf > /dev/null
echo -e "\
<FilesMatch \\.php$>
    SetHandler \${PHP83}
</FilesMatch>

AccessFileName .htaccess .phpv

<Directory /home/raphael/Web> \n \
	Options Indexes FollowSymLinks \n \
	AllowOverride All \n \
	Require all granted \n \
</Directory> \n \
<VirtualHost *:443> \n \
	ServerName local.host \n \
	DocumentRoot /home/raphael/Web \n \
	SSLEngine On \n \
	SSLCertificateFile /etc/ssl/certs/ssl-cert-snakeoil.pem \n \
	SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key \n \
	ErrorLog ${APACHE_LOG_DIR}/error-ssl.log \n \
	CustomLog ${APACHE_LOG_DIR}/access-ssl.log combined \n \
</VirtualHost> \n \
<VirtualHost *:443> \n \
    ServerAlias *.*.*.local.host \n \
    VirtualDocumentRoot /home/raphael/Web/%3/%2/%1 \n \
	SSLEngine On \n \
	SSLCertificateFile /etc/ssl/certs/ssl-cert-snakeoil.pem \n \
	SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key \n \
	ErrorLog ${APACHE_LOG_DIR}/error-ssl.log \n \
	CustomLog ${APACHE_LOG_DIR}/access-ssl.log combined \n \
</VirtualHost> \n \
<VirtualHost *:443> \n \
    ServerAlias *.*.local.host \n \
    VirtualDocumentRoot /home/raphael/Web/%2/%1 \n \
	SSLEngine On \n \
	SSLCertificateFile /etc/ssl/certs/ssl-cert-snakeoil.pem \n \
	SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key \n \
    ErrorLog ${APACHE_LOG_DIR}/error-ssl.log \n \
    CustomLog ${APACHE_LOG_DIR}/access-ssl.log combined \n \
</VirtualHost> \n \
<VirtualHost *:443> \n \
    ServerAlias *.local.host \n \
    VirtualDocumentRoot /home/raphael/Web/%1 \n \
	SSLEngine On \n \
	SSLCertificateFile /etc/ssl/certs/ssl-cert-snakeoil.pem \n \
	SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key \n \
    ErrorLog ${APACHE_LOG_DIR}/error-ssl.log \n \
    CustomLog ${APACHE_LOG_DIR}/access-ssl.log combined \n \
</VirtualHost> \n \
" | sudo tee /etc/apache2/sites-available/localhost-ssl.conf > /dev/null

sudo a2dissite 000-default
sudo a2ensite localhost
sudo a2ensite localhost-ssl

sudo service apache2 restart

sudo service php5.6-fpm reload
sudo service php5.6-fpm restart

sudo service php7.0-fpm reload
sudo service php7.0-fpm restart

sudo service php7.2-fpm reload
sudo service php7.2-fpm restart

sudo service php7.4-fpm reload
sudo service php7.4-fpm restart

sudo service php8.0-fpm reload
sudo service php8.0-fpm restart

sudo service php8.2-fpm reload
sudo service php8.2-fpm restart

sudo service php8.3-fpm reload
sudo service php8.3-fpm restart



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 19.1. Install phpMyAdmin \n \
----------------------------------------------- \n \
${C_RESET}"
# Install phpMyAdmin
wget https://files.phpmyadmin.net/phpMyAdmin/5.2.1/phpMyAdmin-5.2.1-english.zip -O ~/Web/phpMyAdmin.zip
unzip ~/Web/phpMyAdmin.zip -d ~/Web
rm ~/Web/phpMyAdmin.zip
mv ~/Web/phpMyAdmin-5.2.1-english ~/Web/phpmyadmin
ln -s ~/Web/phpmyadmin ~/Web/pma
echo -e "\
<?php \n \
\$cfg['blowfish_secret'] = '$(uuidgen)'; \n \
\$cfg['Servers'][1]['auth_type'] = 'config'; \n \
\$cfg['Servers'][1]['user'] = '$USER'; \n \
\$cfg['Servers'][1]['AllowNoPassword'] = true; \n \
" | tee ~/Web/phpmyadmin/config.inc.php > /dev/null



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 20. Download Third-party DEB packages \n \
----------------------------------------------- \n \
${C_RESET}"
# Download DEB packages
wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -P ~/deb_temp/
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P ~/deb_temp/
wget https://code.visualstudio.com/sha/download?build=stable\&os=linux-deb-x64 -O ~/deb_temp/code.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb -P ~/deb_temp/
wget "https://go.microsoft.com/fwlink?linkid=2149051&brand=M102" -O ~/deb_temp/edge.deb
wget $DEB_URL_DOCKER -P ~/deb_temp/
wget $DEB_URL_VBOX -P ~/deb_temp/
wget $DEB_URL_DRAWIO -P ~/deb_temp/
wget $VBOX_EXT_PACK -O ~/Oracle_VM_VirtualBox_Extension_Pack.vbox-extpack



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 21. Install Third-party DEB packages \n \
----------------------------------------------- \n \
${C_RESET}"
# Install DEB packages and dependencies
sudo dpkg -i ~/deb_temp/*.deb
sudo apt-get install -f -y
rm -rf ~/deb_temp



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 21. Install VirtualBox Extension Pack \n \
----------------------------------------------- \n \
${C_RESET}"
# Install VirtualBox Extension Pack
sudo vboxmanage extpack install --replace ~/Oracle_VM_VirtualBox_Extension_Pack.vbox-extpack
rm ~/Oracle_VM_VirtualBox_Extension_Pack.vbox-extpack



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 22. Install Dotnet 6 \n \
----------------------------------------------- \n \
${C_RESET}"
# Install DotNet 6
sudo apt-get update
sudo apt install dotnet-apphost-pack-6.0 dotnet-hostfxr-6.0 dotnet-runtime-6.0 dotnet-runtime-deps-6.0 dotnet-sdk-6.0 dotnet-targeting-pack-6.0 aspnetcore-runtime-6.0 aspnetcore-targeting-pack-6.0 -y



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 23. Download Composer \n \
----------------------------------------------- \n \
${C_RESET}"
# Download Composer
wget https://getcomposer.org/download/latest-stable/composer.phar -O ~/bin/composer
wget https://getcomposer.org/download/latest-1.x/composer.phar -O ~/bin/composer1
chmod +x ~/bin/composer
chmod +x ~/bin/composer1



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 24. Setup aliases and symlinks \n \
----------------------------------------------- \n \
${C_RESET}"
# Setup aliases and symlinks
touch ~/.bash_aliases
echo "alias cu='composer update'" >> ~/.bash_aliases
echo "alias cr='composer require'" >> ~/.bash_aliases
echo "alias ci='composer install'" >> ~/.bash_aliases
echo "alias pa='php artisan'" >> ~/.bash_aliases
echo "alias ni='npm install'" >> ~/.bash_aliases
echo "alias nr='npm run'" >> ~/.bash_aliases
echo "alias gc='git clone'" >> ~/.bash_aliases
echo "alias gf='git fetch'" >> ~/.bash_aliases
echo "alias gp='git pull'" >> ~/.bash_aliases
echo "alias gfp='git fetch && git pull'" >> ~/.bash_aliases
ln -s /usr/bin/gnome-calculator ~/bin/calc



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 26. Add custom pvm script \n \
----------------------------------------------- \n \
${C_RESET}"
# Add custom pvm script
echo "#!/bin/bash" > ~/bin/pvm
echo "" >> ~/bin/pvm
echo "if [ \$# -lt 1 ]; then" >> ~/bin/pvm
echo "    echo -e \"Usage:\\n\\" >> ~/bin/pvm
echo "    pvm list                List installed PHP versions\\n\\" >> ~/bin/pvm
echo "    pvm current             Show current PHP version\\n\\" >> ~/bin/pvm
echo "    pvm use <version>       Change PHP version to specified\\n\\" >> ~/bin/pvm
echo "    pvm help                Show this message\"" >> ~/bin/pvm
echo "else" >> ~/bin/pvm
echo "    if [ \$1 == \"use\" ]; then" >> ~/bin/pvm
echo "        if [ \$# -lt 2 ]; then" >> ~/bin/pvm
echo "            echo \"You need to specify the version you want to use. To check existing versions, run 'pvm list'\"" >> ~/bin/pvm
echo "        else" >> ~/bin/pvm
echo "            sudo update-alternatives --set php /usr/bin/php\$2" >> ~/bin/pvm
echo "        fi" >> ~/bin/pvm
echo "    elif [ \$1 == \"current\" ]; then" >> ~/bin/pvm
echo "        LINK=\`readlink -f /etc/alternatives/php\`" >> ~/bin/pvm
echo "        echo \"\$LINK\" | sed -r 's/[/usr/bin/php]+//g'" >> ~/bin/pvm
echo "    elif [ \$1 == \"list\" ]; then" >> ~/bin/pvm
echo "        LIST=\`find /usr/bin -type f -name \"*php*\"\`" >> ~/bin/pvm
echo "        echo \"\$LIST\" | sed -r 's/[/usr/bin/php]+//g'" >> ~/bin/pvm
echo "    else" >> ~/bin/pvm
echo "        echo -e \"Usage:\\n\\" >> ~/bin/pvm
echo "    pvm list                List installed PHP versions\\n\\" >> ~/bin/pvm
echo "    pvm current             Show current PHP version\\n\\" >> ~/bin/pvm
echo "    pvm use <version>       Change PHP version to specified\\n\\" >> ~/bin/pvm
echo "    pvm help                Show this message\"" >> ~/bin/pvm
echo "    fi" >> ~/bin/pvm
echo "fi" >> ~/bin/pvm
chmod +x ~/bin/pvm



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 27. Setup user envvar PATH \n \
----------------------------------------------- \n \
${C_RESET}"
# Setup path
echo "export PATH=\$PATH:$HOME/bin" >> ~/.bashrc



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 28. Setup user groups \n \
----------------------------------------------- \n \
${C_RESET}"
# Setup user groups
sudo usermod -aG vboxusers $USER
sudo usermod -aG sambashare $USER



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 29. Download applets and themes \n \
----------------------------------------------- \n \
${C_RESET}"
wget https://cinnamon-spices.linuxmint.com/files/applets/hwmonitor@sylfurd.zip -O ~/.local/share/cinnamon/applets/hwmonitor@sylfurd.zip
unzip ~/.local/share/cinnamon/applets/hwmonitor@sylfurd.zip -d ~/.local/share/cinnamon/applets/
rm ~/.local/share/cinnamon/applets/hwmonitor@sylfurd.zip

wget https://github.com/dracula/gtk/archive/refs/heads/master.zip -O ~/.themes/Dracula.zip
unzip ~/.themes/Dracula.zip -d ~/.themes
mv ~/.themes/gtk-master ~/.themes/Dracula
rm ~/.themes/Dracula.zip

wget https://github.com/dracula/gtk/archive/refs/heads/alt-style.zip -O ~/.themes/Dracula-alt-style.zip
unzip ~/.themes/Dracula-alt-style.zip -d ~/.themes
mv ~/.themes/gtk-alt-style ~/.themes/Dracula-alt-style
rm ~/.themes/Dracula-alt-style.zip



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 30. Apply initial desktop customizations \n \
----------------------------------------------- \n \
${C_RESET}"
# Apply initial desktop customizations
cp ./wallpaper.jpg $HOME/wallpaper.jpg
gsettings set org.cinnamon.theme name "Dracula-alt-style"
gsettings set org.cinnamon.desktop.interface gtk-theme "Dracula-alt-style"
gsettings set org.cinnamon.desktop.interface icon-theme "Papirus-Dark"
gsettings set org.cinnamon.desktop.wm.preferences button-layout "close,minimize,maximize:"
gsettings set org.cinnamon.desktop.wm.preferences theme "Dracula-alt-style"
gsettings set org.cinnamon.desktop.wm.preferences mouse-button-modifier ""
gsettings set org.cinnamon.desktop.background picture-options "zoom"
gsettings set org.cinnamon.desktop.background picture-uri "file://$HOME/wallpaper.jpg"
gsettings set org.cinnamon panels-enabled "['1:0:top', '2:0:bottom']"
gsettings set org.cinnamon panels-height "['1:28', '2:40']"
gsettings set org.cinnamon panel-zone-icon-sizes "[{\"panelId\": 1, \"left\": 16, \"center\": 16, \"right\": 16}, {\"left\": 16, \"center\": 24, \"right\": 16, \"panelId\": 2}]"
gsettings set org.cinnamon panel-zone-symbolic-icon-sizes "[{\"panelId\": 1, \"left\": 16, \"center\": 16, \"right\": 16}, {\"left\": 16, \"center\": 24, \"right\": 16, \"panelId\": 2}]"
gsettings set org.cinnamon panel-zone-text-sizes "[{\"panelId\":1,\"left\":0,\"center\":0,\"right\":0},{\"left\":0,\"center\":0,\"right\":0,\"panelId\":2}]"
gsettings set org.cinnamon enabled-applets "['panel2:center:0:menu@cinnamon.org:0', 'panel2:center:1:grouped-window-list@cinnamon.org:2', 'panel1:right:2:systray@cinnamon.org:3', 'panel1:right:3:xapp-status@cinnamon.org:4', 'panel1:right:4:notifications@cinnamon.org:5', 'panel1:right:5:printers@cinnamon.org:6', 'panel1:right:6:removable-drives@cinnamon.org:7', 'panel1:right:7:keyboard@cinnamon.org:8', 'panel1:right:8:favorites@cinnamon.org:9', 'panel1:right:9:network@cinnamon.org:10', 'panel1:right:10:sound@cinnamon.org:11', 'panel1:right:11:power@cinnamon.org:12', 'panel1:center:0:calendar@cinnamon.org:13', 'panel2:right:1:cornerbar@cinnamon.org:14', 'panel1:right:1:hwmonitor@sylfurd:15', 'panel1:left:0:user@cinnamon.org:16', 'panel2:left:0:expo@cinnamon.org:17']"
gsettings set org.cinnamon favorite-apps "['firefox.desktop', 'mintinstall.desktop', 'cinnamon-settings.desktop', 'org.gnome.Terminal.desktop', 'nemo.desktop', 'gnome-system-monitor.desktop']"
gsettings set org.cinnamon.desktop.keybindings looking-glass-keybinding "[]"
gsettings set org.cinnamon.desktop.keybindings.wm panel-run-dialog "['<Super>r']"
gsettings set org.cinnamon.desktop.keybindings.media-keys screensaver "['<Super>l', 'XF86ScreenSaver']"
gsettings set org.cinnamon window-effect-speed "0"
gsettings set org.cinnamon.sounds notification-file '/usr/share/mint-artwork/sounds/map.oga'
gsettings set org.cinnamon.sounds switch-enabled false
gsettings set org.cinnamon.sounds tile-enabled false

gsettings set org.cinnamon.desktop.keybindings.media-keys screenshot "[]"
gsettings set org.cinnamon.desktop.keybindings custom-list "['__dummy__', 'custom0']"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom0/binding "['Print']"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom0/command "'flatpak run org.flameshot.Flameshot gui'"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom0/name "'Take Screenshot (Flameshot)'"


echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 31. Setup DNS with dnsmasq and NetworkManager \n \
----------------------------------------------- \n \
${C_RESET}"
# Setup DNS
sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved
echo "address=/local.host/127.0.0.1" | sudo tee /etc/NetworkManager/dnsmasq.d/localhost.conf > /dev/null
echo -e "\
[main] \n \
plugins=ifupdown,keyfile \n \
dns=dnsmasq \n \
\n \
[ifupdown] \n \
managed=false \n \
\n \
[device] \n \
wifi.scan-rand-mac-address=no \n \
" | sudo tee /etc/NetworkManager/NetworkManager.conf > /dev/null
sudo systemctl restart NetworkManager.service



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 32. Add user to Samba \n \
----------------------------------------------- \n \
${C_RESET}"
# Add user to Samba
sudo smbpasswd -a $USER



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 33. Setup MySQL \n \
----------------------------------------------- \n \
${C_RESET}"
# Add user to Samba
sudo mysql_secure_installation
sudo mysql --execute="CREATE USER $USER;"
sudo mysql --execute="GRANT ALL PRIVILEGES ON *.* TO $USER;"
sudo mysql --execute="FLUSH PRIVILEGES;"



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 34. Install Android Studio \n \
----------------------------------------------- \n \
${C_RESET}"
# Install Android Studio
wget $ANDROID_STUDIO_PACKAGE -O ~/Applications/android-studio.tar.gz
tar -xvf ~/Applications/android-studio.tar.gz -C ~/Applications
rm ~/Applications/android-studio.tar.gz



echo -e "${C_YELLOW}\
----------------------------------------------- \n \
## 35. Install Go Lang \n \
----------------------------------------------- \n \
${C_RESET}"
# Install Go Lang
wget $GO_PACKAGE -O ~/Applications/go.tar.gz
tar -xvf ~/Applications/go.tar.gz -C ~/Applications
rm ~/Applications/go.tar.gz
ln -s ~/Applications/go/bin/go ~/bin/go
ln -s ~/Applications/go/bin/gofmt ~/bin/gofmt



echo -e "${C_GREEN}\
----------------------------------------------- \n \
## Finished! \n \
----------------------------------------------- \n \
${C_RESET}"
