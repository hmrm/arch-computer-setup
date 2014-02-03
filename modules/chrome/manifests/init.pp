class chrome {
  package { 'google-chrome-stable':
    ensure   => latest,
  }
}
