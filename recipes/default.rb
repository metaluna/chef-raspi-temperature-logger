#
# Cookbook Name:: temperature_log
# Recipe:: default
#
# Copyright (c) 2018 Simon Hardijanto, All Rights Reserved.

return unless node['platform'] == 'raspbian'

app_user = 'root'
app_group = 'root'
install_dir = '/usr/local/bin'
log_dir = '/var/log/temperature'
logrotate_dir = '/etc/logrotate.d'
script_name = 'log_temp.sh'
log_name = 'temperature.log'

# Create log directories
[log_dir, "#{log_dir}/archive"].each do |dir|
  directory dir do
    owner app_user
    group app_group
    mode '0755'
  end
end

template "#{install_dir}/#{script_name}" do
  source "#{script_name}.erb"
  owner app_user
  group app_group
  mode '0750'
  variables log_path: "#{log_dir}/#{log_name}"
end

template "#{logrotate_dir}/temperature" do
  source 'logrotate.d/temperature.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables log_dir: log_dir, log_name: log_name
end


cron "[temperature_log] Log temperature" do
  user app_user
  minute '5'
  command "#{install_dir}/#{script_name}"
end

