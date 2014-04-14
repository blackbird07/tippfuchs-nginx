fail2ban_jail 'nginx-noscript' do
  jail   :enabled     => 'true',
         :port        => 'http,https',
         :logpath     => '/var/log/nginx*/error*.log',
         :maxretry    => '1',
         :findtime    => '86400',   # 1 day
         :bantime     => '2592000'  # 1 month
  
  filter :failregex   => 'Unable to open primary script: .+, client: <HOST>',
         :ignoreregex => ''
end

fail2ban_jail 'nginx-badrequests' do
  jail   :enabled     => 'true',
         :port        => 'http,https',
         :logpath     => '/var/log/nginx*/access*.log',
         :maxretry    => '1',
         :findtime    => '86400',   # 1 day
         :bantime     => '2592000'  # 1 month
  
  filter :failregex   => ['^<HOST> - .* "(GET|POST|HEAD).*HTTP.*" 444 0 ".+" ".+"$',
                          '^<HOST> - .* "POST /wp-comments-post.php HTTP.*" 403 [0-9]{1,} ".+" ".+"$'],
         :ignoreregex => ''
end

fail2ban_jail 'nginx-badbots' do
  jail   :enabled     => 'true',
         :port        => 'http,https',
         :logpath     => '/var/log/nginx*/access*.log',
         :maxretry    => '2',
         :findtime    => '3600',    # 1 hour
         :bantime     => '2592000'  # 1 month
  
  filter :failregex   => '^<HOST> - .* "-" ".*(?:Sogou web spider|Baiduspider|Abonti|Pixray|CPython|Spinn3r|libwww-perl).*"$',
         :ignoreregex => ''
end

fail2ban_jail 'nginx-proxy' do
  jail   :enabled     => 'true',
         :port        => 'http,https',
         :logpath     => '/var/log/nginx*/access*.log',
         :maxretry    => '1',
         :findtime    => '86400',   # 1 day
         :bantime     => '2592000'  # 1 month
  
  filter :failregex   => '^<HOST> -.*GET http.*',
         :ignoreregex => ''
end