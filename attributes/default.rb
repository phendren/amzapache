# amzapache attributes

default[:amzapache][:document_root] = '/var/www/html'
default[:amzapache][:dir]         = '/etc/httpd'
default[:amzapache][:log_dir]     = '/var/log/httpd'
default[:amzapache][:user]        = 'apache'
default[:amzapache][:group]       = 'apache'
default[:amzapache][:binary]      = '/usr/sbin/httpd'
default[:amzapache][:icondir]     = '/var/www/icons/'
default[:amzapache][:init_script] = '/etc/init.d/httpd'
default[:amzapache][:http_port] = 80
default[:amzapache][:ssl_port] = 443
default[:amzapache][:contact] = 'you@yourdomain.com'
default[:amzapache][:servhost] = 'yourdomain.com'
default[:amzapache][:timeout] = 120
default[:amzapache][:keepalive] = 'Off'
default[:amzapache][:keepaliverequests] = 100
default[:amzapache][:keepalivetimeout] = 3

