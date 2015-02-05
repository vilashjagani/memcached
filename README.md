#### memcached installation ##



1) install puppet Agent on server

  wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb

  dpkg -i puppetlabs-release-trusty.deb

  apt-get install puppet
  Add Proxy setting in puppet
  vi /etc/puppet/puppet.conf

 http_proxy_host = x.x.x.x

 http_proxy_port = port-number 

 https_proxy_host = x.x.x.x

 https_proxy_port = port-number

2) Install memcached on server

       make sure /usrdata mount point is available or create mkdir /userdata

       Download memcahed-install.pp from 
         https://github.com/vilashjagani/memcached/raw/master/memcached-install.pp

       apply memcahced puppet menifest

       puppet apply memcached-install.pp
       
      change IP address of replication server of memcached in /etc/defaults/memcachedrep
3)  start memcached service
      /etc/init.d/memcachedrep start
