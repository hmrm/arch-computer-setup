class ocaml {
  package { 'ocaml':
    ensure => latest,
  }

  package { 'ocaml-findlib':
    ensure => latest,
  }
}
