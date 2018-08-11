#
# Cookbook Name:: temperature_log
# Recipe:: default
#
# Copyright (c) 2018 Simon Hardijanto, All Rights Reserved.

return unless node['platform'] == 'raspbian'

config = node['temperature_log']
install_dir = '/usr/local/bin'
logrotate_dir = '/etc/logrotate.d'
script_name = 'log_temp.sh'
log_name = 'temperature.log'

# Create log directories
[config['log_dir'], "#{config['log_dir']}/archive"].each do |dir|
  directory dir do
    owner config['user']
    group config['group']
    mode '0755'
  end
end

template "#{install_dir}/#{script_name}" do
  source "#{script_name}.erb"
  owner config['user']
  group config['group']
  mode '0750'
  variables log_path: "#{config['log_dir']}/#{log_name}"
end

template "#{logrotate_dir}/temperature" do
  source 'logrotate.d/temperature.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables log_dir: config['log_dir'], log_name: log_name, keep_log_count: config['keep_log_count']
end


cron "[temperature_log] Log temperature" do
  user config['user']
  minute "*/#{config['log_interval']}"
  command "#{install_dir}/#{script_name}"
end
