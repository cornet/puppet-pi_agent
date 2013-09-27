node 'raspberrypi' {
  include base
  include sphinx
  include festival

  class {'monit::config':
    bind_address => '0.0.0.0',
    allow        => ['localhost','10.0.0.0/8']
  }
  include monit

  file {'/etc/motd':
    owner  => 'root',
    group  => 'root',
    mode   => '0655',
    source => 'puppet:///modules/pi/motd',
  }

  # This sets LD_ env variables for sphinx
  # TODO Recompile sphinx to install to /usr
  file {'/home/pi/.profile':
    owner  => 'pi',
    group  => 'pi',
    mode   => '0644',
    source => 'puppet:///modules/pi/profile',
  }

  # Blacklist the CDROM kernel modules due to USB
  # devices that have (flakey) built in cd drive 
  file {'/etc/modprobe.d/cdrom-blacklist.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0655',
    content => "blacklist cdrom\nblacklist sr_mod",
  }

  # Make sure the output on the alsa card is set correctly
  # TODO Probably should be moved into code base
  exec {'change-sound-to-headphones':
    command => 'amixer cset numid=3 1',
  }
}
