# chef_pi

A Chef cookbook that makes sure the config in `cloudinit` is still correct.

## Running

- Install [chef-workstation](https://downloads.chef.io/chef-workstation)
- Run `chef-run`

```bash
chef-run <comma_separated_list_of_ips> recipes/default.rb --user ubuntu
```
