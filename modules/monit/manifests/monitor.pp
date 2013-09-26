define monit::monitor (
  $content     = undef,
  $source      = undef
)
  {
	file {
		"/etc/monit.d/${name}.conf" :
			owner   => 'root',
			group   => 'root',
			mode    => '0640',
			source  => $source,
      content => $content,
      notify  => Class['monit::service']
	}
}
