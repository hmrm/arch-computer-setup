class go {
  include apt
  apt::ppa { 'ppa:duh/golang': }

  exec { 'update to get golang':
    require => Apt::Ppa['ppa:duh/golang'],
    command => 'sudo apt-get update',
    path    => ['/sbin/','/bin/', '/usr/bin/'],
  }

  package { 'golang':
    ensure  => latest,
    require => Exec['update to get golang'],
  }
}
