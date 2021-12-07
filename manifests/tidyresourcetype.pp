class basicresourcetypes::tidyresourcetype {
  # include basicresourcetypes::tidyfiles::stagetidyfiles
  # Class {'basicresourcetypes::tidyfiles::filecreationdeclaration':
  #   stage => 'filecreationdeclaration',
  # }
  # Class {'basicresourcetypes::tidyfiles::filecopy':
  #   stage  => 'filecopy',
  # }
  # exec {'wait for 2s':
  #   command => 'sleep 10',
  #   path    => ['/usr/bin', '/bin'],
  # }
  # Class { 'basicresourcetypes::tidyfiles::tidyfilesdemo':
  #   stage => 'main',
  # }
  # Class ['basicresourcetypes::tidyfiles::filecreationdeclaration','basicresourcetypes::tidyfiles::filecopy','basicresourcetypes::tidyfiles::tidyfilesdemo' ] -> Exec['wait for 2s']
  #Exec['wait for 2s'] -> Class['basicresourcetypes::tidyfiles::tidyfilesdemo']
}
