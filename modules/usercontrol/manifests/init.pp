class usercontrol {
  $user = hiera('user')
  $group = hiera('group')

  user { $user :
    manage_homedir => true,
    group => $group,
  }
}
