class users{

user { 'fundamentals':
    ensure        => 'present',
    home           => '/home/fundamentals',
    shell          => '/bin/bash',
}
}
