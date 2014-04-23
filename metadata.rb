name             'tippfuchs-nginx'
maintainer       'Enrico Mraß'
maintainer_email 'enrico.mrass@gmail.com'
license          'All rights reserved'
description      'Installs/Configures tippfuchs-nginx'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.10'

depends 'nginx',              '~> 2.6.0'
depends 'tippfuchs-fail2ban', '~> 0.1.0'