#
# Cookbook Name:: tippfuchs-nginx
# Recipe:: default
#
# Copyright (C) 2014 Enrico Mraß
# 
# All rights reserved - Do Not Redistribute
#

include_recipe 'nginx'


# need to delete default page configs
file "#{node['nginx']['dir']}/conf.d/default.conf" do
  action :delete
  notifies :reload, 'service[nginx]', :immediately
end

file "#{node['nginx']['dir']}/conf.d/example_ssl.conf" do
  action :delete
  notifies :reload, 'service[nginx]', :immediately
end