#
# Cookbook Name:: webgrind-cookbook
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

include_recipe 'git'
include_recipe 'webgrind-cookbook::default'

# Install Webgrind
# https://github.com/jokkedk/webgrind.git

git "#{node[:apache][:docroot_dir]}/webgrind" do
  repository "https://github.com/jokkedk/webgrind.git"
  user "root"
  action :checkout
end

#install apache settings directly to /etc/apache2/sites-enabled/
template "/etc/apache2/sites-enabled/webgrind.conf" do
 source "webgrind.conf.erb"
 owner "root"
 group 0
 mode 00644
 notifies :reload, "service[apache2]"
end
