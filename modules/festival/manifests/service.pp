class festival::service {
  service {'festival':
    ensure    => 'running',
    enable    => true,
    hasstatus => false,
  }
}
