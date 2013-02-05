addsite
====================================================

  Copyright (C) 2013 Apinan Woratrakun All rights reserved.

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

 Script create by Apinan Woratrakun
 Follow me on http://tutorcenter.org/profile/iamapinan, http://www.facebook.com/mrapinan

 This script support on Debian server such as Ubuntu, debian, Linux Mint Debian Edition, and more.
 Create for a apache web server you must have to install apache2 on your server
 This script will automatic add a new domain to apache virtual hosts.
 and also create default web directory with index.html file.
 You can also edit this file if you want

 Example.com (/etc/apache2/sites-available/www.example.com)
 This is virtual host example code.

 <VirtualHost *>
        ServerAdmin webmaster@example.com
        ServerName  www.example.com
       ServerAlias example.com

        # Indexes + Directory Root.
        DirectoryIndex index.html
       DocumentRoot /home/www/www.example.com/htdocs/

        # CGI Directory
        ScriptAlias /cgi-bin/ /home/www/www.example.com/cgi-bin/
        <Location /cgi-bin>
                Options +ExecCGI
        </Location>


        # Logfiles
        ErrorLog  /home/www/www.example.com/logs/error.log
       CustomLog /home/www/www.example.com/logs/access.log combined
 </VirtualHost>

Example of use
===========================
> 
