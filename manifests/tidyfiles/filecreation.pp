class basicresourcetypes::tidyfiles::filecreation(
  Array[Hash[String,Variant[String,Integer]]] $file_creation_hash_arr,
) {
      $file_creation_hash_arr = [
        {
          'extension' => '.tmp',
          'number'    => 5,
        },
        {
          'extension' => '.tmpfile',
          'number'    => 3,
        },
        {
          'extension' => '.temp',
          'number'    => 7,
        },
        {
          'extension' => '.txt',
          'number'    => 4,
        },
        {
          'extension' => '.pdf',
          'number'    => 3,
        },
    ]
    file {'tidy-tmp-1':
      ensure => directory,
      path   => '/tmp/tidy-tmp-1',
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
    }
    file {'tidy-tmp-2':
      ensure => directory,
      path   => '/tmp/tidy-tmp-2',
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
    }
    file {'tidy-tmp-3':
      ensure => directory,
      path   => '/tmp/tidy-tmp-3',
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
    }
    file {'tidy-tmp-4':
      ensure => directory,
      path   => '/tmp/tidy-tmp-4',
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
    }
    $default_attrs = {
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
    $dir_arr=[ '/tmp/tidy-tmp-1', '/tmp/tidy-tmp-2', '/tmp/tidy-tmp-3', '/tmp/tidy-tmp-4' ]
    $file_creation_hash_arr.each |$element| {
      Integer[0, $element['number']].each |$file_no| {
        $dir_arr.each |$dir| {
          file{"${dir}/file${element['extension']}${file_no}":
            * => $default_attrs
          }
        }
      }
    }
    file {'tmp/tidy-tmp-3-pdf-dir1':
      ensure => directory,
      path   => '/tmp/tidy-tmp-3/pdf-dir1',
    }
    file {'tmp/tidy-tmp-3-pdf-dir1-tmp-dir2':
      ensure => directory,
      path   => '/tmp/tidy-tmp-3/pdf-dir1/tmp-dir2',
    }
    file {'tmp/tidy-tmp-3-pdf-dir1-tmp-dir2-temp-dir3':
      ensure => directory,
      path   => '/tmp/tidy-tmp-3/pdf-dir1/tmp-dir2/temp-dir3',
    }
    file {'tmp/tidy-tmp-3-pdf-dir1-tmp-dir2-temp-dir3-txt-dir4':
      ensure => directory,
      path   => '/tmp/tidy-tmp-3/pdf-dir1/tmp-dir2/temp-dir3/txt-dir4',
    }
}
