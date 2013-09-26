class monit {
  Class['monit::install'] -> Class['monit::config'] ~> Class['monit::service']

  include monit::install, monit::config, monit::service
}
