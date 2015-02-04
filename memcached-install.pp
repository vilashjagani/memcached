package {[ "build-essential", 
            "libevent-2.0-5", 
	    "libevent-core-2.0-5", 
            "libevent-dev", 
            "libevent-extra-2.0-5", 
            "libevent-openssl-2.0-5", 
            "libevent-pthreads-2.0-5", 
            "unzip" ]:
         ensure => "installed",

} ->
user {"jersey":
            ensure => "present",
            managehome => true,
            shell => '/bin/bash',
      } ->
exec {"memcached-install":
      command => "mkdir -p /usrdata/source;
                  mkdir -p /usrdata/memcached;
                  wget -e use_proxy=yes -e https_proxy=10.135.80.164:8678 -O /usrdata/source/master.zip  https://github.com/ignacykasperowicz/repcached/archive/master.zip;
                  cd /usrdata/source;
                  unzip master.zip;
                  cd repcached-master;
                  ./configure --prefix=/usrdata/memcached --enable-replication --enable-64bit;
                  make;
                  make install;
                  mkdir -p /usrdata/memcached/var/run/memcached;
                  mkdir -p /usrdata/memcached/oiddir";
                 chown -R postgres:postgres /usrdata/memcached;
                 echo \"DAEMON_ARGS="-m 28672 -p 11211 -U 11211 -c 8192 -u postgres -P /usrdata/memcached/memcachedrep.pid -d -v -t 32 -x 192.168.59.51"\" > /etc/default/memcachedrep;,
                 echo \"### -x IP-address is replication server of memcached###\" >> /etc/default/memcachedrep;,
      path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
     } ->
exec {"memcached-config":
      command => "sudo su jersey -c 'mkdir ~/memcached'",
      path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
     }

