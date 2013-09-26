node 'raspberrypi' {
  include base
  include sphinx
  include festival
  class {'monit::config':
    bind_address => '0.0.0.0',
    allow        => ['localhost','10.0.0.0/8']
  }
  include monit

  # This sets LD_ env variables for sphinx
  # TODO Recompile sphinx to install to /usr
  file {'/home/pi/.profile':
    owner  => 'pi',
    group  => 'pi',
    mode   => '0644',
    source => 'puppet:///modules/pi/profile',
  }

  exec {'change-sound-to-headphones':
    command => 'amixer cset numid=3 1',
  }
}
