class basicresourcetypes::tidyresourcetype {
  include basicresourcetypes::tidyfiles::stagetidyfiles
  Class {'basicresourcetypes::tidyfiles::filecreationdeclaration':
    stage => 'filecreationdeclaration',
  }
  Class {'basicresourcetypes::tidyfiles::filecopy':
    stage  => 'filecopy',
  }
}
