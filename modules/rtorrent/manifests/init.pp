class rtorrent {
  package { 'screen':
    ensure => latest,
  }

  package { 'rtorrent':
    ensure => latest,
  }
}
