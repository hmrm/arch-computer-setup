class rtorrent {
  $user = hiera('user')

  file { '/etc/systemd/system/rtorrent.service':
    mode    => '644',
    owner   => 'root',
    group   => 'root',
    content => template('rtorrent/rtorrent.service.erb'),
    notify  => Service['rtorrent'],
  }

  service { 'rtorrent':
    ensure  => running,
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
