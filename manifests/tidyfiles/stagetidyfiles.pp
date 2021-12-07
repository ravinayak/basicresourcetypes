class basicresourcetypes::tidyfiles::stagetidyfiles {
  stage { 'filecreationdeclaration':
    before => Stage['filecopy'],
  }
  stage { 'filecopy':
    before => Stage['main'],
  }
}
