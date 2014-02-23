class plex {
  package { 'plexmediaserver':
    ensure => latest,
  }

  service { 'plexmediaserver':
    ensure    => running,
    enable    => true,
    subscribe => Package['plexmediaserver'],
    require   => Package['plexmediaserver'],
  }
}
