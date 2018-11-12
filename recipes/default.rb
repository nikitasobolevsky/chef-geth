#
# Cookbook:: geth
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'toml'

group node['geth']['group'] do
  gid '30303'
  system true
end

user node['geth']['user'] do
  uid '30303'
  gid '30303'
  home node['geth']['base_path']
  system true
end

[
  node['geth']['config']['Eth.Ethash']['DatasetDir'],
  node['geth']['config']['Node']['DataDir']
].each do |dir|
  directory dir do
    owner node['geth']['user']
    group node['geth']['group']
    mode '0755'
    recursive true
    action :create
  end
end

file node['geth']['conf_file'] do
  content TOML::Generator.new(node['geth']['config']).body
  mode '0644'
  owner node['geth']['user']
  group node['geth']['group']
  notifies :restart, 'service[geth]', :delayed
end

tar_extract node['geth']['uri'] do
  checksum node['geth']['sha']
  target_dir '/usr/bin'
  tar_flags ['--exclude COPYING', '--strip-components 1']
end

systemd_unit 'geth.service' do
  content(
    Unit: {
      Description: 'Go Ethereum Daemon',
      After: 'network.target'
    },
    Service: {
      Type: 'simple',
      ExecStart: "/usr/bin/geth --config #{node['geth']['conf_file']}",
      User: node['geth']['user'],
      Group: node['geth']['group'],
      Restart: 'on-failure'
    },
    Install: {
      WantedBy: 'multi-user.target'
    }
  )
  action :create
end

service 'geth' do
  action %i[enable start]
end
