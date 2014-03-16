class chrome {
  package { 'google-chrome':
    ensure   => latest,
  }

  file { '/usr/bin/google-chrome':
    ensure  => link,
    target  => '/usr/bin/google-chrome-stable',
    require => Package['google-chrome'],
  }

  exec { 'chromedriver':
    command => 'wget http://chromedriver.storage.googleapis.com/`curl chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip -O /tmp/chromedriver.zip; unzip /tmp/chromedriver.zip -d /usr/bin',
    require => [Package['wget'], Package['curl'], Package['unzip'],],
    creates => '/usr/bin/chromedriver',
    path    => '/usr/bin',
  }

  file { '/usr/bin/chromedriver':
    mode    => '755',
    require => Exec['chromedriver'],
  }
}
