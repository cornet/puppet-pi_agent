class festival::config {
  file {'/etc/default/festival':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => 'RUN_FESTIVAL=yes'
  }

  file {'/etc/init.d/festival':
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => 'puppet:///modules/festival/festival.init',
    require => File['/etc/default/festival'],
  }
}
