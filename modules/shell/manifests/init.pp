class shell {
  $user = hiera('user')

  package { 'oh-my-zsh-git':
    ensure => latest,
  }

  file { "/home/${user}/.zshrc":
    ensure => present,
    mode   => '755',
    source => '/usr/share/oh-my-zsh/zshrc',
    require => Package['oh-my-zsh-git'],
    owner => $user,
    group => 'wheel',
  }
}
