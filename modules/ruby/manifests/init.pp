class ruby {
  $user = hiera('user')

  exec { 'install rvm':
    command => 'curl -L https://get.rvm.io | bash -s stable --ruby; source ~/.rvm/scripts/rvm; rvm pkg install openssl; rvm reinstall all --force;',
    path => ['/usr/bin', '/bin', '/sbin', '/usr/sbin'],
    creates => "/home/${user}/.rvm",
    user => $user,
    environment => ["HOME=/home/${user}/"],
    require => Package['curl'],
  }
}
