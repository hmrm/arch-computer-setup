class emacs {
  $user = hiera('user')
  package { 'emacs-snapshot-common':
    ensure => 'purged',
  }

  package { 'emacs-snapshot-bin-common':
    ensure => 'purged',
  }

  package { 'emacs-snapshot':
    ensure => 'purged',
  }

  package { 'emacs-snapshot-gtk':
    ensure => 'purged',
  }

  package { 'emacs-snapshot-el':
    ensure => 'purged',
  }

  package { 'emacs23':
    ensure => 'purged',
  }

  package { 'emacs-23-bin-common':
    ensure => 'purged',
  }

  package { 'emacs-23-common':
    ensure => 'purged',
  }

  package { 'emacs23-el':
    ensure => 'purged',
  }

  package { 'emacs23-nox':
    ensure => 'purged',
  }

  package { 'emacs23-lucid':
    ensure => 'purged',
  }

  package { 'auctex':
    ensure => 'purged',
  }

  apt::ppa { 'ppa:cassou/emacs': }

  package { 'emacs24':
    ensure => 'latest',
  }

  package { 'emacs24-el':
    ensure => 'latest',
  }

  package { 'emacs24-common-non-dfsg':
    ensure => 'latest',
  }

  package { 'emacs-goodies-el':
    ensure => 'latest',
  }

  file { "/home/${user}/.emacs":
    mode => '744',
    owner => $user,
    source => 'puppet:///modules/emacs/DOTemacs',
  }
}
