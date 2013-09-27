class base {
  package {
    'git-core':       ensure => 'installed';
    'screen':         ensure => 'installed';
    'sqlite3':        ensure => 'installed';
    'libsqlite3-dev': ensure => 'installed';
    # Required to build listener.c
    'libasound2-dev': ensure => 'installed';
  }

  package {'bundler':
    ensure   => 'installed',
    provider => 'gem'
  }
}

#
# Include this if you need to build sphinxbase from
# source rather than using the supplied packages
#
class build {
  # Packages required to build sphinx
  $sphinx_build_pkgs = [
    'build-essential',
    'python2.7-dev',
    'bison',
    'automake',
    'libtool'
  ]
  package {$sphinx_build_pkgs: ensure => 'installed'}

  # Packages needed for the packaging
  package {
    'ruby-dev':
      ensure => 'installed';
    'fpm':
      ensure   => 'installed',
      provider => 'gem';
  }
}
