default['nginx']['install_method']       = 'package'
default['nginx']['repo_source']          = 'nginx'    # install nginx from PPA

default['nginx']['default_site_enabled'] = false

default['nginx']['worker_processes']     = node['cpu'] && node['cpu']['total'] ? node['cpu']['total'] : 1

default['nginx']['server_tokens']        = 'off'
default['nginx']['keepalive_timeout']    = 65

# TODO
#ssl_session_cache   shared:SSL:10m;
#ssl_session_timeout 10m;


## Vagrant:
user www-data;
worker_processes  1;

error_log  /var/log/nginx/error.log;
pid        /var/run/nginx.pid;

events {
  worker_connections  1024;
}

http {

  include       /etc/nginx/mime.types;
  default_type  application/octet-stream;

  access_log    /var/log/nginx/access.log;

  sendfile on;
  tcp_nopush on;
  tcp_nodelay on;

  keepalive_timeout  65;

  gzip  on;
  gzip_http_version 1.0;
  gzip_comp_level 2;
  gzip_proxied any;
  gzip_vary off;
  gzip_types text/plain text/css application/x-javascript text/xml application/xml application/rss+xml application/atom+xml text/javascript application/javascript application/json text/mathml;
  gzip_min_length  1000;
  gzip_disable     "MSIE [1-6]\.";

  server_names_hash_bucket_size 64;
  types_hash_max_size 2048;
  types_hash_bucket_size 64;

  include /etc/nginx/conf.d/*.conf;
  include /etc/nginx/sites-enabled/*;
}


