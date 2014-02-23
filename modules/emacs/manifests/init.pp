class emacs {
  package { 'emacs-nox':
    ensure => latest,
  }

  file { "/home/${user}/.emacs":
    mode => '744',
    owner => $user,
    source => 'puppet:///modules/emacs/DOTemacs',
  }
}
