class utilities {
  $email = hiera('email')
  $fullname = hiera('fullname')
  $user = hiera('user')

  package { 'sublime-text':
    ensure => latest,
  }

  package { 'intellij-idea-community-edition':
    ensure => latest,
  }

  package { 'gimp':
    ensure => latest,
  }

  package { 'archey3':
    ensure => latest,
  }

  package { 'base':
    ensure => latest,
  }

  package { 'base-devel':
    ensure => latest,
  }

  package { 'yaourt':
    ensure => latest,
  }

  package { 'openssh':
    ensure => latest,
  }

  service { 'sshd':
    ensure  => running,
    enable  => true,
    require => Package['openssh'],
  }

  package { 'tmux':
    ensure => latest,
  }

  package { 'cloc':
    ensure => latest,
  }

  package { 'mutt':
    ensure => latest,
  }

  package { 'smtp-forwarder':
    ensure => latest,
  }

  package { 'mailutils':
    ensure => latest,
  }

  package { 'curl':
    ensure => latest,
  }

  package { 'wget':
    ensure => latest,
  }

  package { 'ack':
    ensure => latest,
  }

  exec { '/usr/bin/ln -s /usr/bin/vendor_perl/ack /usr/bin/ack':
    require => Package['ack'],
    creates => '/usr/bin/ack',
  }

  package { 'graphviz':
    ensure => latest,
  }

  package { 'w3m':
    ensure => latest,
  }

  package { 'gcc':
    ensure => latest,
  }

  package { 'autoconf':
    ensure => latest,
  }

  package { 'sqlite3':
    ensure => latest,
  }

  package { 'ncurses':
    ensure => latest,
  }

  package { 'openssl':
    ensure => latest,
  }

  package { 'flex':
    ensure => latest,
  }

  package { 'bison':
    ensure => latest,
  }

  package { 'libxslt':
    ensure => latest,
  }

  package { 'fop':
    ensure => latest,
  }

  package { 'clang':
    ensure => latest,
  }

  package { 'gcc-fortran':
    ensure => latest,
  }

  package { 'texlive-bin':
    ensure => latest,
  }
  package { 'texlive-most':
    ensure => latest,
  }
  package { 'texlive-lang':
    ensure => latest,
  }

  package { 'automake':
    ensure => latest,
  }

  package { 're2c':
    ensure => latest,
  }

  package { 'libtool':
    ensure => latest,
  }

  package { 'r':
    ensure => latest,
  }

  package { 'htop':
    ensure => latest,
  }

  package { 'gnugo':
    ensure => latest,
  }

  package { 'libyaml':
    ensure => latest,
  }

  package { 'git':
    ensure => latest,
  }

  exec { "/usr/bin/git config --global --replace-all user.email \"${email}\"":
    user => $user,
    require => Package['git'],
    cwd => "/home/${user}/",
    environment => ["HOME=/home/${user}/"],
  }

  exec { "/usr/bin/git config --global --replace-all user.name \"${fullname}\"":
    user => $user,
    require => Package['git'],
    cwd => "/home/${user}/",
    environment => ["HOME=/home/${user}/"],
  }

  exec { '/usr/bin/git config --global color.ui true':
    user => $user,
    require => Package['git'],
    cwd => "/home/${user}/",
    environment => ["HOME=/home/${user}/"],
  }

  package { 'man-pages':
    ensure => latest,
  }

  package { 'iptraf-ng':
    ensure => latest,
  }

  package { 'markdown':
    ensure => latest,
  }

  package { 'valgrind':
    ensure => latest,
  }

  package { 'nmap':
    ensure => latest,
  }

  package { 'zsh':
    ensure => latest,
  }

  package { 'bash-completion':
    ensure => latest,
  }

  package { 'sl':
    ensure => latest,
  }

  package { 'ddate':
    ensure => latest,
    # ensure => earliest!
  }

  file { "/home/${user}/bin":
    ensure => directory,
    owner  => $user,
    group  => $group,
  }

  file { "/home/${user}/bin/mostmem":
    mode   => '755',
    owner  => $user,
    group  => $group,
    source => 'puppet:///module/utilities/mostmem',
  }

  file { "/home/${user}/bin/mostcpu":
    mode   => '755',
    owner  => $user,
    group  => $group,
    source => 'puppet:///module/utilities/mostcpu',
  }
}
