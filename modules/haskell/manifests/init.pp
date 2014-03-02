class haskell {
  package { 'ghc':
    ensure => 'latest',
  }

  package { 'cabal-install':
    ensure => 'latest',
  }
}
