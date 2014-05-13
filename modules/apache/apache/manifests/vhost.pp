define apache::vhost (
  $port       = '80',
  $docowner   = $apache::httpd_user,
  $docgroup   = $apache::httpd_group,
  $confdir    = $apache::httpd_conf_dot_d,
  $priority   = '10',
  $options    = 'Indexes MultiViews',
  $vhost_name = $title,
  $servername = $title,
  $docroot    = "${apache::httpd_docroot}/${title}",
){
  host { $servername:
    ip => $::ipaddress,
  }
  File {
    owner => $docowner,
    group => $docgroup,
    mode  => '0644',
  }
  file { "${confdir}/${priority}-${title}.conf":
    ensure  => file,
    notify  => Service[$apache::httpd_svc],
    content => template('apache/vhost.conf.erb'),
    require => Package[$apache::httpd_pkg],
  }
  file { $docroot:
    ensure => directory,
  }
  file { "${docroot}/index.html":
    ensure  => file,
    content => template("apache/index.html.erb"),
  }
}
