class basicresourcetypes::prestage::defaultmainstage1 {
  file { 'default-main-stage-1' :
    ensure  => file,
    path    => '/tmp/default-main-stage-1.txt',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => 'Default-Main-Stage-1',
  }
}
