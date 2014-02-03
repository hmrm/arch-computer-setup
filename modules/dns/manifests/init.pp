class dns {
  package { 'dnsmasq':
    ensure => latest,
  }
}
