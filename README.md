#### memcached installation ##
Download memcahed-install.pp from 
https://github.com/vilashjagani/memcached/raw/master/memcached-install.pp


install puppet on your server
wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
dpkg -i puppetlabs-release-trusty.deb
apt-get install puppet


set proxy in /etc/puppet/puppet.conf file
http_proxy_host = x.x.x.x
http_proxy_port = port-number
https_proxy_host = x.x.x.
https_proxy_port = port-number

make sure /usrdata mount point is available or create mkdir /userdata

apply memcahced puppet menifest

puppet apply memcached-install.pp
