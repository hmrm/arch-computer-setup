class django {
  require python

  package { 'django':
    provider => 'pip',
    ensure   => 'latest',
  }
}
