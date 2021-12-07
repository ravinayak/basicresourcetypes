class basicresourcetypes::tidyfiles::filecopy{
  exec {'copy-pdf':
    command => 'sudo mv /tmp/tidy-tmp-3/file.pdf* /tmp/tidy-tmp-3/pdf-dir1/',
    unless  => 'test -f /tmp/tidy-tmp-3/pdf-dir1/file.pdf0',
    path    => ['/usr/bin'],
  }
  exec {'copy-tmp':
    command => 'sudo mv /tmp/tidy-tmp-3/file.tmp* /tmp/tidy-tmp-3/pdf-dir1/tmp-dir2/',
    unless  => 'test -f /tmp/tidy-tmp-3/pdf-dir1/tmp-dir2/file0.tmp',
    path    => ['/usr/bin'],
  }
  exec {'copy-temp':
    command => 'sudo mv /tmp/tidy-tmp-3/file.temp* /tmp/tidy-tmp-3/pdf-dir1/tmp-dir2/temp-dir3/',
    unless  => 'test -d /tmp/tidy-tmp-3/pdf-dir1/tmp-dir2/temp-dir3/file0.temp',
    path    => ['/usr/bin'],
  }
  exec {'copy-txt':
    command => 'sudo mv /tmp/tidy-tmp-3/file.txt* /tmp/tidy-tmp-3/pdf-dir1/tmp-dir2/temp-dir3/txt-dir4/',
    unless  => 'test -d /tmp/tidy-tmp-3/pdf-dir1/tmp-dir2/temp-dir3/txt-dir4/file0.txt',
    path    => ['/usr/bin'],
  }
}
