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
    source => 'puppet:///modules/apache/index.html'}
  
  service {'httpd':
      ensure => 'running',
      enable => 'true',
    }

}
