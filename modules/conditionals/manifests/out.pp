class conditionals::out {

  file{'/tmp/os':
      ensure  => 'file',
      content =>  $::operatingsystem ?{
        'centos' => "I am on CentOs",
        'ubuntu' => "I am on Ubuntu",
      },

  }


}
