class sphinx {

  file {'/tmp/sphinxbase-0.8_armhf.deb':
    ensure => 'present',
    source => 'puppet:///modules/sphinx/sphinxbase-0.8_armhf.deb',
  }

  package {'sphinxbase':
    provider => 'dpkg',
    ensure   => 'latest',
    source   => '/tmp/sphinxbase-0.8_armhf.deb',
    require  => File['/tmp/sphinxbase-0.8_armhf.deb'],
  }

  file {'/tmp/pocketsphinx-0.8_armhf.deb':
    ensure => 'present',
    source => 'puppet:///modules/sphinx/pocketsphinx-0.8_armhf.deb',
  }

  package {'pocketsphinx':
    provider => 'dpkg',
    ensure   => 'latest',
    source   => '/tmp/pocketsphinx-0.8_armhf.deb',
    require  => File['/tmp/pocketsphinx-0.8_armhf.deb'],
  }

}
