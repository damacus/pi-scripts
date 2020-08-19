package 'nfs-common'

reboot 'reboot' do
  action :nothing
end

# https://www.raspberrypi.org/documentation/configuration/config-txt/
append_if_no_line 'reduce gpu memory' do
  path '/boot/config.txt'
  line 'gpu_mem=16'
  notifies :request_reboot, 'reboot[reboot]'
end

boot_file = '/boot/firmware/cmdline.txt'

file boot_file do
  owner 'root'
  group 'root'
  content content 'cgroup_memory=1 cgroup_enable=memory net.ifnames=0 dwc_otg.lpm_enable=0 console=serial0,115200 console=tty1 root=LABEL=writable rootfstype=ext4 elevator=deadline rootwait fixrtc'
  not_if { ::File.readlines(boot_file).grep(/cgroup_memory/).any? }
end
