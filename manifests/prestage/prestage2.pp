class basicresourcetypes::prestage::prestage2 {
  file { 'pre-stage-2':
    ensure  => file,
    path    => '/tmp/pre-stage-2.txt',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => 'Pre-Stage-2',
    stage   => 'pre-stage',
  }
}
