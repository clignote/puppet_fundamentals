class users::admins {

  group {'sysadmin': 
  ensure => present,
  }

  user {'zed':
    ensure => present,
    gid    => 'sysadmin',
  }

}
