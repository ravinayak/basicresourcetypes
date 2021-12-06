class basicresourcetypes::mainstage::defaultmainstage2 {
    file { 'default-main-stage-2' :
    ensure  => file,
    path    => '/tmp/default-main-stage-2.txt',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => 'Default-Main-Stage-2',
  }
  exec { 'list-contents-tmp-dir':
    command => '/usr/bin/ls /tmp',
  }
}
