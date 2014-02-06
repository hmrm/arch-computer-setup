class erlang {
  require 'utilities'
  
  $repo_url = 'http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb'

  exec { 'get erlang repo deb':
    command => "wget $repo_url -O /var/tmp/erl.deb",
    path    => ['/sbin/','/bin/', '/usr/bin/'],
    creates => '/var/tmp/erl.deb',
  }

  exec { 'install erlang repo deb':
    require => Exec['get erlang repo deb'],
    path    => ['/sbin/','/bin/', '/usr/bin/'],
    command => 'sudo dpkg -i /var/tmp/erl.deb; touch /var/tmp/erl_repo_installed',
    creates => '/var/tmp/erl_repo_installed',
  }

  exec { 'update to get erlang':
    require => Exec['install erlang repo deb'],
    path    => ['/sbin/','/bin/', '/usr/bin/'],
    command => 'sudo apt-get update',
  }

  package { 'erlang':
    require => Exec['update to get erlang'],
    ensure  => 'latest',
  }
}
