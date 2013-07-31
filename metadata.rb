name             'php5-redis'
maintainer       'Colin Darie'
maintainer_email 'colindarie@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures php5-redis'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'
%w[debian].each do |os|
  supports os
end

recipe "php5-redis::install", "This recipe is used to install php5-redis"

depends "php"
