class python {
  package { 'python':
    ensure => 'latest',
  }

  package { 'python2':
    ensure => 'latest',
  }

  package { 'ipython':
    ensure => 'latest',
  }

  package { 'python-pip':
    ensure => 'latest',
  }

  package { 'python-nose':
    ensure => 'latest',
  }

  package { 'pypy':
    ensure => 'latest',
  }
}
