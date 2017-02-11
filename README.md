NewSite Script ![alt text](https://travis-ci.org/iamapinan/adddomain.svg?branch=master "Build Status")
====================================================

Auto domain generate domain for apache2

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
 Follow me on http://plus.noeplaza.org/profile/iamapinan, http://www.facebook.com/mrapinan

 This script support on Debian server such as Ubuntu, debian, Linux Mint Debian Edition, and more.
 Create for a apache web server you must have to install apache2 on your server
 This script will automatic add a new domain to apache virtual hosts.
 and also create default web directory with index.html file.
 You can also edit this file if you want

 Example.com (/etc/apache2/sites-available/www.example.com)
 This is virtual host example code.
```
<VirtualHost *>
        ServerAdmin webmaster@example.com
        ServerName  www.example.com
        ServerAlias example.com

        #Indexes + Directory Root.
        DirectoryIndex index.html
        DocumentRoot /home/www/www.example.com/htdocs/

        # CGI Directory
        ScriptAlias /cgi-bin/ /home/www/www.example.com/cgi-bin/
        <Location /cgi-bin>
                Options +ExecCGI
        </Location>

        #Logfiles
        ErrorLog  /home/www/www.example.com/logs/error.log
        CustomLog /home/www/www.example.com/logs/access.log combined

</VirtualHost>
```
Example of use
===========================
```
 root:>./newsite.sh
 
 Get help by email: iamapinan@gmail.com
 Press Ctrl+C to terminate operation
=======================================
What user name to use as own:?
admin
Directory for site:?
example.org
=======================================
System will create directory for example.org
=======================================
Press [ENTER] to continue...
Creating directory...
Put new index.html file to home directory
Successfully...
========================================
Press [ENTER] to continue...
Adding domain to apache
Enabling site example.org.conf.
To activate the new configuration, you need to run:
  service apache2 reload
 * Restarting web server apache2                                                 [ OK ]
========================================================
Your domain directory is /home/admin/www/example.org/public_html/
Already to add your domain to apache web server
You can open web browser and type http://example.org to test it...
========================================================
Press [ENTER] to continue...

```
