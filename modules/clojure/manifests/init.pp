class clojure {
  require utilities
  require homedir
  include java
  
  $user     = hiera('user')
  
  $uri      = 'https://raw.github.com/technomancy/leiningen/stable/bin/lein'
  $home     = "/home/${user}"
  $home_bin = "${home}/bin"

  exec { "install leiningen for ${user}":
    path    => ['/sbin/','/bin/'],
    command => "curl -sL ${uri} > ${home_bin}/lein",
    creates => "${home_bin}/lein",
  }

  file { "${home_bin}/lein":
    mode    => '0755',
    require => Exec["install leiningen for ${user}"],
  }
}
