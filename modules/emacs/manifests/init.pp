class emacs {
  $user = hiera('user')
  
  package { 'emacs-nox':
    ensure => latest,
  }

  file { "/home/${user}/.emacs":
    mode => '744',
    owner => $user,
    group => 'wheel',
    source => 'puppet:///modules/emacs/DOTemacs',
  }
}
