class festival::install {
  package {'festival':
    ensure => 'installed',
  }

  # Install some voices
  package {
    'festvox-don': ensure       => 'installed';
    'festvox-rablpc16k': ensure => 'installed';
    'festlex-oald': ensure      => 'installed';
  }
}
