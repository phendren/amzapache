#
# Cookbook Name:: amzapache
# Recipe:: default
#
# Apache 2.0 - phendren - originally for Sounds True
#


package 'httpd' do
 package_name 'httpd'
  action :install
end

package 'mod_ssl' do
 package_name 'mod_ssl'
 action :install
end

cookbook_file "/etc/httpd/conf.d/ssl.conf" do
  source "ssl.conf.txt"
  mode '0644'
  owner 'root'
  group 'root'
end

service 'httpd' do
  action :enable
end

directory "/etc/httpd/ssl" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end  

# This is some simple bash-fu for creating a module listing
bash "module-listing" do
cwd "/etc/httpd"
user "root"
code <<-EOH
build="# dynamic module listing\n"
echo $build > /tmp/modules.txt.erb
cd /etc/httpd/modules;
for list in $(ls); do
        base=$(basename $list .so)
        name=$(echo $base | sed -r 's/^.{4}//')
        part="_module"
       echo "LoadModule $name$part modules/$list" >> /tmp/modules.txt.erb
done
	EOH
end

template 'httpd.conf' do
  path "/etc/httpd/conf/httpd.conf"
  source 'httpd.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

cookbook_file "/var/www/html/index.html" do
 source "index.html.txt"
 mode "0644"
 owner 'apache'
 group 'apache'
end

service "httpd" do
stop_command "/etc/init.d/httpd stop"
start_command "/etc/init.d/httpd start"
restart_command "/etc/init.d/httpd restart"
action :restart
end

