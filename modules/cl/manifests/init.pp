class cl {
  require utilities

  $user = hiera('user')
  $quicklisp_uri = 'http://beta.quicklisp.org/quicklisp.lisp'

  package { 'sbcl':
    ensure => latest,
  }
  
  exec { 'quicklisp download':
    path    => ['/sbin/','/bin/', '/usr/bin/'],
    command => "wget ${quicklisp_uri} -O /home/${user}/cl/quicklisp.lisp",
    creates => "/home/${user}/cl/quicklisp.lisp",
  }
  
  file { "/home/${user}/cl/":
    ensure => directory,
  }

  file { "/home/${user}/cl/quicklisp.lisp":
    require => [Exec['quicklisp download'],
                File["/home/${user}/cl/"]],
    mode    => '0755',
  }

  file { "/home/${user}/cl/setting-up-quicklisp.lisp":
    mode    => '0755',
    require => File["/home/${user}/cl/"],
    content => template('cl/setting-up-quicklisp.lisp.erb'),
  }

# Unfortunately, the quicklisp installation requires the user to press enter
# which means that it errors when puppet tries to install it
#
#  exec { 'quicklisp installation':
#    path    => ['/sbin/','/bin/', '/usr/bin/'],
#    command => "sbcl --script /home/${user}/cl/setting-up-quicklisp.lisp",
#    require => [File["/home/${user}/cl/quicklisp.lisp"], 
#                File["/home/${user}/cl/setting-up-quicklisp.lisp"]],
#  }
}
