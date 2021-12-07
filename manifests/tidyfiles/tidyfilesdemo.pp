class basicresourcetypes::tidyfiles::tidyfilesdemo{
  tidy { 'tidytmp1-dir':
    path    => '/tmp/tidy-tmp-1',
    matches => ['/*tmp*/','/*pdf*/','/*temp*/'],
    size    => '1k',
    recurse => 1,
  }
  tidy { 'tidytmp2-dir':
    path      => '/tmp/tidy-tmp-2',
    matches   => ['/*tmp*/','/*pdf*/'],
    age       => '1s',
    type      => 'atime',
    max_files => 50,
    recurse   => 1,
  }
  tidy { 'tidytmp3-dir':
    path    => '/tmp/tidy-tmp-3',
    matches => ['/*tmp*/', '/*temp*/', '/*txt*/'],
    size    => '1k',
    age     => '1s',
    type    => 'mtime',
    recurse => true,
    rmdirs  => true,
  }
  tidy { 'tidytmp4-dir':
    path    => '/tmp/tmp-dir-4',
    matches => ['/*pdf*/'],
    recurse => true,
  }
  notice('I am in class tidyfilesdemo')
}
