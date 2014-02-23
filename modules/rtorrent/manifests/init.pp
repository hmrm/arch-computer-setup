class rtorrent {
  package { 'rtorrent':
    ensure => latest,
  }
}
