class monit::service {
	service { 'monit':
			ensure => 'stopped',
      enable => false,
	}
}
