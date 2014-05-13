define apache::vhost (
    $port        =  '80',
    $priority    =  '10',
    $options     =  'Indexes MultiViews',
    $vhost_name  =  '$name',
    $servername  =  'title',
    $logdir      =  '/var/log/httpd',
){ 
  file  {"/etc/httpd/conf.d/${name}.conf":
    ensure  => file,
    owner   => 'apache',
    group   => 'apache',
    mode    => '0644',
    content =>  template('apache/vhost.conf.erb'),
    }  
}
