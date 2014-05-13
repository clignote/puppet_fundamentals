class apache {

  package { 'apache':
      name     => 'httpd', # (namevar) The package name.  This is the name that the...
      ensure   => 'present', # What state the package should be in. On...
      }

  file {  '/var/www':
    ensure => 'directory',
    mode   => '0755',
  }

  file { '/var/www/html':
    ensure => 'directory',
    mode   => '0755',
  } 

  file { '/var/www/html/index.html':
    ensure => 'file',
    source => 'puppet:///modules/apache/index.html'
  }
  
  file {'/etc/httpd/conf/httpd.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    require =>  Package['httpd'],
  }


  service {'httpd':
      ensure    => 'running',
      enable    => 'true',
      subscribe =>  File['/etc/httpd/conf/httpd.conf'],
    }

}
