class apache {

  File {
    owner => 'apache',
    group => 'apache',
    mode  => '0644',
  }

  package { 'apache':
      name     => 'httpd', # (namevar) The package name.  This is the name that the...
      ensure   => 'present', # What state the package should be in. On...
      }

  file {  '/var/www':
    ensure => 'directory',
  }

  file { '/var/www/html':
    ensure => 'directory',
  } 

  file { '/var/www/html/index.html':
    ensure => 'file',
    content => template('/apache/index.html.erb'),
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
