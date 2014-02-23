class clojure {
  package { 'leiningen':
    ensure => latest,
  }

  package { 'leiningen-completions' :
    ensure => latest,
  }
}
