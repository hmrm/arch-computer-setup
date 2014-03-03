class emacs {
  $user = hiera('user')
  $group = hiera('group')
  
  package { 'emacs-nox':
    ensure => latest,
  }

  file { "/home/${user}/.emacs":
    mode => '744',
    owner => $user,
    group => $group,
    source => 'puppet:///modules/emacs/DOTemacs',
  }
}
