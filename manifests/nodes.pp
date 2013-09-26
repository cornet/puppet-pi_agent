node 'raspberrypi' {
  include base
  include sphinx
  include festival

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
