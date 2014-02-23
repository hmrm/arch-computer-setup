class ntp {
  package { 'ntp':
    ensure => latest,
  }

  service { 'ntpd':
    ensure    => running,
    enable    => true,
    require   => Package['ntp'],
    subscribe => Package['ntp'],
  }
}
