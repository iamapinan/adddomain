#!/bin/bash
#
#  Copyright (C) 2013 Apinan Woratrakun All rights reserved.
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
# Script create by Apinan Woratrakun
# Follow me on http://tutorcenter.org/profile/iamapinan, http://www.facebook.com/mrapinan
#
# This script support on Debian server such as Ubuntu, debian, Linux Mint Debian Edition, and more.
# Create for a apache web server you must have to install apache2 on your server
# This script will automatic add a new domain to apache virtual hosts.
# and also create default web directory with index.html file.
# You can also edit this file if you want
#
# Example.com (/etc/apache2/sites-available/www.example.com)
# This is virtual host example code.
#
# <VirtualHost *>
#        ServerAdmin webmaster@example.com
#        ServerName  www.example.com
#       ServerAlias example.com
#
#        # Indexes + Directory Root.
#        DirectoryIndex index.html
#       DocumentRoot /home/www/www.example.com/htdocs/
#
#        # CGI Directory
#        ScriptAlias /cgi-bin/ /home/www/www.example.com/cgi-bin/
#        <Location /cgi-bin>
#                Options +ExecCGI
#        </Location>
#
#
#        # Logfiles
#        ErrorLog  /home/www/www.example.com/logs/error.log
#       CustomLog /home/www/www.example.com/logs/access.log combined
# </VirtualHost>
#

export PS1="\033[01;32m"
export PS2="\033[01;31m"
export RES="\033[0m"
export who=`whoami`

export ApacheSite='/etc/apache2/sites-available/'
export indexfile='index.html'

if [[ $who != "root" ]];then
        echo -e "$PS2 Sorry, you are not a root user. please login by root user and try again...$RES"
  	exit
fi

clear

echo ""
echo -e "$PS1 Get help by email: iamapinan@gmail.com"
echo -e " Press Ctrl+C to terminate operation"
echo ""
echo "======================================="
echo -e "What user name to use as own:? $owner"
read owner
echo ""
echo -e "Directory for site:? $domain"
read domain
echo ""
echo "======================================="
echo -e "System will create directory for $domain"
echo "======================================="
echo ""
read -p "Press [ENTER] to continue..."
echo -e "Creating directory..."

#
# Create directory for new domain
#

if [ ! -d /home/$owner ]; then
    mkdir -p /home/$owner
	mkdir -p /home/$owner/www
fi

if [ ! -d /home/$owner/www/$domain ]; then
    mkdir -p /home/$owner/www/$domain
else
	echo -e "$PS2 This domain already exists...!$RES"
	read -p " Press [ENTER] to exit..."
	exit
fi

mkdir -p /home/$owner/www/$domain/public_html
mkdir -p /home/$owner/www/$domain/public_html/cgi-bin
mkdir -p /home/$owner/www/$domain/logs

echo -e "Put new index.html file to home directory"
echo "<h2 align=center>Welcome to $domain </h2>" > /home/$owner/www/$domain/public_html/$indexfile
echo "<p align=center>Virtual domain default page by <a href='http://tutorcenter.org/profile/iamapinan'>Apinan woratrakun</a></p>" >> /home/$owner/www/$domain/public_html/$indexfile
echo ""
echo -e "Successfully..."
echo ""
echo "========================================"
read -p "Press [ENTER] to continue..."
echo ""
echo -e "Adding domain to apache"
echo -e "\n" >> "$ApacheSite/$domain.conf"
echo "#" > "$ApacheSite/$domain.conf"
echo "# Config for $domain" >> "$ApacheSite/$domain.conf"
echo "# Create by Apinan Woratrakun" >> "$ApacheSite/$domain.conf"
echo "#" >> "$ApacheSite/$domain.conf"
echo -e "\n" >> "$ApacheSite/$domain.conf"
echo "<VirtualHost *>" >> "$ApacheSite/$domain.conf"
echo -e "\n" >> "$ApacheSite/$domain.conf"
echo "ServerAdmin webmaster@$domain" >> "$ApacheSite/$domain.conf"
echo "ServerName  $domain" >> "$ApacheSite/$domain.conf"
echo "ServerAlias  $domain " >> "$ApacheSite/$domain.conf"
echo -e "\n" >> "$ApacheSite/$domain.conf"
echo "# Indexes + Directory Root." >> "$ApacheSite/$domain.conf"
echo "DirectoryIndex index.html" >> "$ApacheSite/$domain.conf"
echo "DocumentRoot /home/$owner/www/$domain/public_html/" >> "$ApacheSite/$domain.conf"
echo -e "\n" >> "$ApacheSite/$domain.conf"
echo "# CGI Directory" >> "$ApacheSite/$domain.conf"
echo "ScriptAlias /cgi-bin/  /home/$owner/www/$domain/public_html/cgi-bin/" >> "$ApacheSite/$domain.conf"
echo -e "\n" >> "$ApacheSite/$domain.conf"
echo "<Location /cgi-bin>" >> "$ApacheSite/$domain.conf"
echo "  Options +ExecCGI " >> "$ApacheSite/$domain.conf"
echo "</Location> " >> "$ApacheSite/$domain.conf"
echo -e "\n" >> "$ApacheSite/$domain.conf"
echo "# Logfiles " >> "$ApacheSite/$domain.conf"
echo "ErrorLog  /home/$owner/www/$domain/logs/error.log" >> "$ApacheSite/$domain.conf"
echo "CustomLog /home/$owner/www/$domain/logs/access.log combined" >> "$ApacheSite/$domain.conf"
echo -e "\n" >> "$ApacheSite/$domain.conf"
echo "</VirtualHost>" >> "$ApacheSite/$domain.conf"


a2ensite "$domain.conf"
/etc/init.d/apache2 restart

echo ""
echo "========================================================"
echo -e "Your domain directory is /home/$owner/www/$domain/public_html/"
echo -e "Already to add your domain to apache web server"
echo -e "You can open web browser and type http://$domain to test it..."
echo "========================================================"
echo -e "$RES"
read -p "Press [ENTER] to continue..."
