amzapache Cookbook
===================
amzapache is a Chef cookbook for installing Apache Web server w/ mod ssl on Amazon Linux.
I have not tested this cookbook on CentOS or RHEL.

Requirements
------------
This cookbook was written for use with AWS OpsWorks (Chef 11) for building a custom
web server layer running Amazon Linux.

http://aws.amazon.com/opsworks/

Attributes
----------
amzapache attributes: Are all related to the included httpd.conf configuration template and are configured as default attributes

`default['amzapache']['document_root']` - Document root - default: /var/www/html<br>
`default['amzapache']['dir']` - Apache config directory - default: /etc/httpd<br>
`default['amzapache']['log_dir']` - Apache log directory - default: /var/log/httpd<br>
`default['amzapache']['user']` - User Apache will run as - default: apache<br>
`default['amzapache']['group']` - Group Apache will run as - default: apache<br>
`default['amzapache']['binary']` - Where binary will live - default: /usr/sbin/httpd<br>
`default['amzapache']['icon_dir']` - Apache icon directory - default: /var/www/icons/<br>
`default['amzapache']['init_script']` - Apache init script - default: /etc/init.d/httpd<br>
`default['amzapache']['http_port']` - Port apache will listen on - default: 80<br>
`default['amzapache']['ssl_port']` - Port SSL will use - default: 443<br>
`default['amzapache']['contact']` - you@yourdomain.com<br>
`default['amzapache']['servhost']` - Domain you want for your default hostname<br>
`default['amzapache']['timeout']` - Apache timeout - default: 120<br>
`default['amzapache']['keepalive']` - Apache keepalive - default: off<br>
`default['amzapache']['keepaliverequests']` - Apache keep alive requests - default: 100<br>
`default['amzapache']['keepalivetimeout']` - Apache keepalive timeout - default: 3<br>

Usage
-----
#### amzapache::default
Installs Apache using the settings as configured in the attributes. This cookbooks is setup to function in combo
with php-pkg (installs PHP) and deployer (which can easily deploy PHP applications from a repo on github).

To use with OpsWorks (Chef 11) - Create a custom layer - add amzapache::default as a custom cookbook to the "setup" event.

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests via test kitchen, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Apache 2.0 License - written by Phil Hendren - github: phendren
philip.hendren[at]gmail.com
