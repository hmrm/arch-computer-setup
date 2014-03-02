class rtorrent {
  $user = hiera('user')

  file { '/etc/systemd/system/rtorrent.service':
    mode    => '644',
    owner   => 'root',
    group   => 'root',
    content => template('rtorrent/rtorrent.service.erb'),
    notify  => Service['rtorrent'],
  }

  file { "/home/${user}/.torrent.d":
    mode => '644',
    owner => $user,
    group => 'wheel',
    ensure => 'directory',
  }

  file { "/home/${user}/.torrent.d/torrents":
    mode => '644',
    owner => $user,
    group => 'wheel',
    ensure => 'directory',
  }

  file { "/home/${user}/.torrent.d/nouptorrents":
    mode => '644',
    owner => $user,
    group => 'wheel',
    ensure => 'directory',
  }

  file { "/home/${user}/.rtorrent.rc":
    mode => '644',
    owner => $user,
    group => 'wheel',
    source => 'puppet:///modules/rtorrent/DOTrtorrent.rc',
  }

  service { 'rtorrent':
    enable  => true,
    require => [
                File['/etc/systemd/system/rtorrent.service'],
                Package['rtorrent'],
                Package['tmux'],
                ],
  }

  package { 'rtorrent':
    ensure => latest,
  }
}
