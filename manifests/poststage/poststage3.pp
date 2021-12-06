class basicresourcetypes::poststage::poststage3 {
  file { 'post-stage-3':
    ensure  => file,
    path    => '/tmp/post-stage-3.txt',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => 'Post-Stage-3',
  }
}
