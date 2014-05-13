include apache
apache::vhost { "myvhost.puppetlabs.vm":
  docowner => $apache::httpd_user,
  docgroup => $apache::httpd_group,
}
