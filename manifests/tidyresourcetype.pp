class basicresourcetypes::tidyresourcetype {
  stage { 'filecreationdeclaration':
    before => Stage['filecopy'],
  }
  stage { 'filecopy':
    before => Stage['main'],
  }
  Class {'basicresourcetypes::tidyfiles::filecreationdeclaration':
    stage => 'filecreationdeclaration',
  }
  Class {'basicresourcetypes::tidyfiles::filecopy':
    stage  => 'filecopy',
  }
  Class { 'basicresourcetypes::tidyfiles::tidyresourcesdescription':
    stage => 'main',
  }
}
