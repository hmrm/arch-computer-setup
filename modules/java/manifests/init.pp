class java {
  include apt

  apt::ppa { 'ppa:webupd8team/java': }

  package { 'oracle-java6-installer':
    ensure => latest,
    before => Package['oracle-java7-set-default'],
  }

  package { 'oracle-java7-installer':
    ensure => latest,
    before => Package['oracle-java7-set-default'],
  }

  package { 'oracle-java8-installer':
    ensure => latest,
    before => Package['oracle-java7-set-default'],
  }

  package { 'oracle-java7-set-default':
    ensure => latest,
  }
}
