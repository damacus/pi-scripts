apt_update

include_recipe 'chef_pi::_system'
include_recipe 'chef_pi::_optimization'

chef_client_systemd_timer 'Schedule chef-client' do
  accept_chef_license true
end
