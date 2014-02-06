node default {
  exec { 'apt-get update':
    path    => ['/sbin/','/bin/', '/usr/bin/'],
  }

  include utilities
  include rtorrent
  include dns
  include chrome
  include java
  include clojure
  include cl
  include python
  include django
  include d
  include emacs
  include erlang
  include go
}
