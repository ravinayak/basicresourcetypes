class basicresourcetypes::tidyfiles::filecreationdeclaration{
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
  Class{ 'basicresourcetypes::tidyfiles::filecreation':
    file_creation_hash_arr => $file_creation_hash_arr,
  }
}
