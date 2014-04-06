default['nginx']['install_method']       = 'package'
default['nginx']['repo_source']          = 'nginx'    # install nginx from PPA

default['nginx']['default_site_enabled'] = false

default['nginx']['server_tokens']        = 'off'
default['nginx']['keepalive_timeout']    = 65

# TODO
#ssl_session_cache   shared:SSL:10m;
#ssl_session_timeout 10m;
