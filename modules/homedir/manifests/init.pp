class homedir {
  $user = hiera('user')
  file { "/home/${user}/bin":
    ensure => directory,
  }
}
