class basicresourcetypes::prestage::prestage1 {
  file { 'pre-stage-1':
    ensure  => file,
    path    => '/tmp/pre-stage-1.txt',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => 'Pre-Stage-1',
  }
}
