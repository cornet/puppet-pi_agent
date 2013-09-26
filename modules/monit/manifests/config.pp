class monit::config (
  $check_interval = '10',
  $http_port      = '2812',
  $bind_address   = 'localhost',
  $allow          = ['localhost']
){

  file {"/etc/monit/monitrc" :
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template('monit/monit.conf.erb'),
  }

}
