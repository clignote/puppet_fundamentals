class ::conditionals::case {

      case $::operatingsystem {
          'centos': {
            $text = "I am on CentOs"
          }
          'debian': {
            $text = "I am on Ubuntu"
          }
}
  file {'/tmp/os':
    ensure  => 'file',
    content =>  $text,
  }
}
