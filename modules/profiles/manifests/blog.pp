class profiles::blog {
  include mysql::server
  class {'mysql::bindings':
    php_enable => true,
  }
  include apache
  include apache::mod::php
  include wordpress
  apache::vhost {'zedymyne.blog.vm':
    port    => '80',
    docroot => '/opt/wordpress',
  }
}
