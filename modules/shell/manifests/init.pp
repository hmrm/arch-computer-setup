class shell {
  $user = hiera('user')

  package { 'oh-my-zsh-git':
    ensure => latest,
  }

  file { "/home/${user}/.zshrc":
    ensure => present,
    mode   => '755',
    source => 'puppet:///modules/shell/DOTzshrc',
    require => Package['oh-my-zsh-git'],
    owner => $user,
    group => 'wheel',
  }

  file { "/home/${user}/.aliases":
    ensure => present,
    mode => '755',
    source => 'puppet:///modules/shell/DOTaliases',
    owner => $user,
    group => 'wheel',
  }
}
