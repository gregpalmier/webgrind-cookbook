#
# Cookbook Name:: webgrind-cookbook
# Recipe:: default
#
# Copyright (C) 2013 Greg Palmier
# 
# All rights reserved - Redistribute
#

# Install the required packages (php5-xdebug)
include_recipe 'apt'
include_recipe 'build-essential'
include_recipe 'php'
include_recipe 'apache2'
include_recipe 'apache2::mod_php5'

case node[:platform]
  when "ubuntu","debian"
    package "php5-xdebug" do
      action :upgrade
  end
  when "centos","redhat"
   package "php-xdebug" do
     action :upgrade
  end
end

cookbook_file "#{node[:php][:apache_conf_dir]}/zz_xdebug.conf" do
  source "xdebug.conf"
  mode "0644"
  owner "root"
  group "root"
end
