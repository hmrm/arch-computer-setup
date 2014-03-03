class usercontrol {
  $user = hiera('user')
  $group = hiera('group')

  user { $user :
    ensure => present,
    managehome => true,
    gid => $group,
  }
}
