class basicresourcetypes::prestage::prestage3 {
  file { 'pre-stage-3':
    ensure  => file,
    path    => '/tmp/pre-stage-3.txt',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => 'Pre-Stage-3',
  }
}
