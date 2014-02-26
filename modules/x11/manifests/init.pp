class x11 {
  $user = hiera('user')

  package { 'xmobar':
    ensure => latest,
  }

  file { "/home/${user}/.xmobarrc":
    mode => '755',
    owner => $user,
    group => 'wheel',
    source => 'puppet:///modules/x11/DOTxmobarrc'
  }

  package { 'xorg-xrdb':
    ensure => latest,
  }

  package { 'xorg-server':
    ensure => latest,
  }

  package { 'xorg-xsetroot':
    ensure => latest,
  }

  package { 'xorg-xmodmap':
    ensure => latest,
  }

  package { 'rxvt-unicode':
    ensure => latest,
  }

  package { 'xmonad':
    ensure => latest,
  }

  package { 'xmonad-contrib':
    ensure => latest,
  }

  package { 'feh':
    ensure => latest,
  }

  package { 'compton-git':
    ensure  => latest,
    require => Package['python2'], # for some reason, this dependency wasn't being resolved for me properly
  }

  file { "/home/${user}/.xinitrc":
    mode => '755',
    owner => $user,
    group => 'wheel',
    source => 'puppet:///modules/x11/DOTxinitrc',
  }

  file { "/home/${user}/.xmonad":
    mode => '755',
    ensure => directory,
    owner => $user,
    group => 'wheel',
  }

  file { "/home/${user}/.xmonad/xmonad.hs":
    mode => '755',
    owner => $user,
    group => 'wheel',
    source => 'puppet:///modules/x11/xmonad.hs',
  }

  file { "/home/${user}/.Xresources":
    mode => '755',
    owner => $user,
    group => 'wheel',
    source => 'puppet:///modules/x11/DOTXresources'
  }

  file { "/home/${user}/.xmodmap":
    mode => '755',
    owner => $user,
    group => 'wheel',
    source => 'puppet:///modules/x11/DOTxmodmap',
  }
}
