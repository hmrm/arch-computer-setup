class shell {
  $user = hiera('user')
  $group = hiera('group')

  package { 'oh-my-zsh-git':
    ensure => latest,
  }

  file { "/home/${user}/.zshrc":
    ensure => present,
    mode   => '755',
    source => 'puppet:///modules/shell/DOTzshrc',
    require => Package['oh-my-zsh-git'],
    owner => $user,
    group => $group,
  }

  file { "/home/${user}/.zprofile":
    ensure  => present,
    mode    => '755',
    source  => 'puppet:///modules/shell/DOTzprofile',
    owner   => $user,
    group   => $group,
  }

  file { "/home/${user}/.aliases":
    ensure => present,
    mode => '755',
    source => 'puppet:///modules/shell/DOTaliases',
    owner => $user,
    group => $group,
  }

  file { "/home/${user}/.dircolors":
    ensure => present,
    mode => '755',
    source => 'puppet:///modules/shell/DOTdircolors',
    owner => $user,
    group => $group,
  }
}
