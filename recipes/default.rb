#
# Cookbook Name:: myusers
# Recipe:: default
#
# Copyright 2015, Fireworks Websites
#
# All rights reserved - Do Not Redistribute
#

node.default['authorization']['sudo']['passwordless'] = true
node.default['authorization']['sudo']['include_sudoers_d'] = true

include_recipe 'user'
include_recipe 'sudo'

# Create groups

group "nobody" do
  :create
end

group "wheel" do
  :create
end

user_account 'joshua' do
  comment   'Josh Marshall'
  gid       'wheel'
  ssh_keys  [
    'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAxf30ae1CE8sl3pSolJymSRUQpngtOa3BVbBtZnW0s+aJmKLAN/JbH5R7y/1XGXomwkk0uKpdJ4v+VVSxLuO2crcpuH5Qp1hrrhbyUUOVGI0V69QPRuFkHNc5NDwxLLhPjTPZQcB+r5haNZcnp3VGCJlu0xdpW16jFExhYzt+2+ydkL+aZEs95g+9LVYRdH0OHRUo56mGnGJnFjNGRj0cUSG1xO3y86MF36mYiNt1ersffdh6FQ6D3+afswdIQ44B+3aVnD7Og8ALI/umxJFhBAZtJ2ytdBm/4ex20qwewwTGfHsDx8JZ2p4UdepT0BSCRMBXCEZCwGnRDJcRMhd0kw== joshua@telly',
    'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQChHX9L8KLhCHVIs9kWnoUlkYAFaC5EXHsUQjU4/s/68ir49Wf2/JgQslpDvmRf8yp0eIyfwQLfQqFz7ICM5kIqGKVEf+kPTsUSu0PDBrwn9qV13Q6vW9CwKqtgrBaRZ2KZkPNB0VCex8fErP5bOpJSFKg1kFWVmoW7GlniDC7/3Fd/DrJDKqFgSeM+wmNIuczj/tSZFOkrqoUcrzZblbZkSX10nmu/koC2BSEbXU3rqyC0kSH4xp4ge9zIVa8HG8wXpfZo3WiC67iJMvWilyMPPwlF6GpkuNwgFRAJv3yZCJTgmjn5ZSgjKBk5IaW8yOPF4oc4mTriqo0h3Bhf65CB joshua@login',
  ]
  home      '/home/joshua'
end

file "/home/joshua/.forward" do
  content 'josh@sanchia.com.au'
  owner 'joshua'
  mode 0600
end

file "/root/.forward" do
  content 'josh@sanchia.com.au'
  owner 'root'
  group 'root'
  mode 0600
end

sudo 'wheel' do
  user      "%wheel"
  nopasswd  true
end

#user_account 'joshm' do
#  action :remove
#end

