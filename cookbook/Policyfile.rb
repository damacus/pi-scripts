name 'chef_pi'
default_source :supermarket
run_list 'chef_pi::default'
cookbook 'chef_pi', path: '.'
