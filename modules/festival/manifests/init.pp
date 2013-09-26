class festival {
  include festival::install, festival::config, festival::service

  Class['festival::install'] -> Class['festival::config'] ~> Class['festival::service']
}
