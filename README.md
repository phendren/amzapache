amzapache Cookbook
===================
This is a relatively straightforward Chef cookbook for installing Apache Web server w/ mod ssl on Amazon Linux
I have not tested this cookbook on CentOS or RHE but it should (in theory) work.

Requirements
------------

I have only tested it with Amazon Linux and I created it for use with AWS OpsWorks for building a custom layer.
Tested with Chef 11.4 

Attributes
----------
amzapache attributes: Are all related to the included httpd.conf configuration template and are configured as default attributes

`default[:amzapache][:document_root]` - Document root - default: /var/www/html
`default[:amzapache][:dir]` - Apache config directory - default: /etc/httpd
`default[:amzapache][:log_dir]` - Apache log directory - default: /var/log/httpd
`default[:amzapache][:user]` - User Apache will run as - default: apache
`default[:amzapache][:group]` - Group Apache will run as - default: apache
`default[:amzapache][:binary]` - Where binary will live - default: /usr/sbin/httpd
`default[:amzapache][:icondir]` - Apache icon directory - default: /var/www/icons/
`default[:amzapache][:init_script]` - Apache init script - default: /etc/init.d/httpd
`default[:amzapache][:http_port]` - Port apache will listen on - default: 80 
`default[:amzapache][:ssl_port]` - Port SSL will use - default: 443
`default[:amzapache][:contact]` - you@yourdomain.com
`default[:amzapache][:servhost]` - Domain you want for your default hostname
`default[:amzapache][:timeout]` - Apache timeout - default: 120
`default[:amzapache][:keepalive]` - Apache keepalive - default: off
`default[:amzapache][:keepaliverequests]` - Apache keep alive requests - default: 100
`default[:amzapache][:keepalivetimeout]` - Apache keepalive timeout - default: 3

Usage
-----
#### amzapache::default
Installs Apache using the settings as configured in the attributes. This cookbooks is setup to function in combo
with php-pkg (installs PHP) and deployer (which can be used to easily deploy applications from github).

To use with OpsWorks - Create a custom layer - add amzapache::default as a custom cookbook to the "setup" event.

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Apache 2.0 License - written by Phil Hendren - github: phendren
gocodeyourself[at]gmail.com

