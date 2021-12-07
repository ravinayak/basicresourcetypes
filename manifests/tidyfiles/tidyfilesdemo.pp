class basicresourcetypes::tidyfiles::tidyfilesdemo{
  # tidy { 'tidytmp1-dir':
  #   path    => '/tmp/tidy-tmp-1',
  #   matches => ['*.tmp*','*.pdf*','*.temp*', '*.txt*'],
  #   size    => '1k',
  #   age     => '1s',
  #   type    => 'atime',
  #   recurse => true,
  # }
  # tidy { 'tidytmp2-dir':
  #   path      => '/tmp/tidy-tmp-2',
  #   matches   => ['*.tmp*','*.pdf*'],
  #   size      => '1k',
  #   age       => '1s',
  #   type      => 'atime',
  #   max_files => 50,
  #   recurse   => true,
  # }
  # tidy { 'tidytmp3-dir':
  #   path    => '/tmp/tidy-tmp-3',
  #   matches => ['*.tmp*', '*.temp*', '*.txt*'],
  #   size    => '1k',
  #   age     => '1s',
  #   type    => 'atime',
  #   recurse => true,
  #   rmdirs  => true,
  # }
  # tidy { 'tidytmp4-dir':
  #   path    => '/tmp/tidy-tmp-4',
  #   matches => ['*.pdf*'],
  #   recurse => true,
  # }
  tidy { 'tmpdir':
    path    => '/tmp',
    matches => ['*pdf*', '*tmp*', '*temp*', '*txt*'],
    recurse => 4,
    size    => '1k',
    rmdirs  => true,
  }
}
