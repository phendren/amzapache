#
# Cookbook Name:: amzapache
# Recipe:: default
#
# Apache 2.0 - phendren - originally for Sounds True
#

package 'httpd' do
  action :install
end

package 'mod_ssl' do
  action :install
end

service 'httpd' do
  stop_command '/etc/init.d/httpd stop'
  start_command '/etc/init.d/httpd start'
  restart_command '/etc/init.d/httpd restart'
  action :enable
end

# Make sure directories exist
%w(
  node['amzapache']['document_root']
  node['amzapache']['icon_dir']
  node['amzapache']['ssl_dir']
).each do |dir|
  directory dir do
    owner 'root'
    group 'root'
    mode 0755
    action :create
  end
end

cookbook_file '/etc/httpd/conf.d/ssl.conf' do
  source 'ssl.conf.txt'
  mode '0644'
  owner 'root'
  group 'root'
end

# Simple bash-fu for creating a module listing
bash 'module-listing' do
  cwd '/etc/httpd'
  user 'root'
  code <<-EOH
    build='# dynamic module listing\n'
    build+='# ordered by filename length'
    echo $build > /tmp/modules.txt.erb
    cd /etc/httpd/modules;
    for list in $(ls |awk '{print length($0)"\t"$0}' |sort -n |cut --complement -f1); do
    base=$(basename $list .so)
    name=$(echo $base | sed -r 's/^.{4}//')
    part="_module"
    echo "LoadModule $name$part modules/$list" >> /tmp/modules.txt.erb
    done
  EOH
end

template 'httpd.conf' do
  path '/etc/httpd/conf/httpd.conf'
  source 'httpd.conf.erb'
  owner 'root'
  group 'root'
  mode 0644
end

cookbook_file '/var/www/html/index.html' do
  source 'index.html.txt'
  mode 0644
  owner 'apache'
  group 'apache'
  notifies :restart, 'service[httpd]'
end
