class basicresourcetypes::poststage::poststage2 {
  file { 'post-stage-2':
    ensure  => file,
    path    => '/tmp/post-stage-2.txt',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => 'Post-Stage-2',
    stage   => 'post-stage',
  }
}
