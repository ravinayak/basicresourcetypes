class basicresourcetypes::poststage::poststage1 {
  file { 'post-stage-1':
    ensure  => file,
    path    => '/tmp/post-stage-1.txt',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => 'Post-Stage-1',
    stage   => 'post-stage',
  }  
}
