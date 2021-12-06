class basicresourcetypes::prestage::defaultmainstage2 {
    file { 'default-main-stage-2' :
    ensure  => file,
    path    => '/tmp/default-main-stage-2.txt',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => 'Default-Main-Stage-2',
  }
  exec { '/bin/ls /tmp':
    name => 'List-contents-tmp-dir',
  }
}
