default['nginx']['install_method']       = 'package'
default['nginx']['repo_source']          = 'nginx'    # install nginx from PPA

default['nginx']['default_site_enabled'] = false

# Config Setup
default['nginx']['user']                 = 'www-data'
default['nginx']['group']                = 'www-data'

default['nginx']['worker_processes']     = node['cpu'] && node['cpu']['total'] ? node['cpu']['total'] : 1
default['nginx']['worker_connections']   = 1024

default['nginx']['disable_access_log']   = false
default['nginx']['server_tokens']        = 'off' # hide the nginx server version
default['nginx']['sendfile']             = 'on'

default['nginx']['keepalive']            = 'on'
default['nginx']['keepalive_timeout']    = 65

default['nginx']['gzip']                 = 'on'