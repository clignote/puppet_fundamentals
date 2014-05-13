class apache (
  $httpd_user       = $apache::params::httpd_user,
  $httpd_group      = $apache::params::httpd_group,
  $httpd_pkg        = $apache::params::httpd_pkg,
  $httpd_svc        = $apache::params::httpd_svc,
  $httpd_conf       = $apache::params::httpd_conf,
  $httpd_confdir    = $apache::params::httpd_confdir,
  $httpd_conf_dot_d = $apache::params::httpd_conf_dot_d,
) inherits apache::params {
  File {
    owner => $httpd_user,
    group => $httpd_group,
    mode  => '0644',
  }
  package { $httpd_pkg:
    ensure => present,
  }
  file { $httpd_conf:
    ensure  => file,
    path    => "${httpd_confdir}/${httpd_conf}",
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/apache/${httpd_conf}",
    require => Package[$httpd_pkg],
  }
  service { $httpd_svc:
    ensure    => running,
    subscribe => File[$httpd_conf],
  }

  # Let the vhost manage the docroot directory.
  apache::vhost { $::fqdn:
    docroot => $httpd_docroot,
  }
}
