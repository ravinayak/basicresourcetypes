class basicresourcetypes::tidyfiles::stagetidyfiles {
  stage { 'filecreationdeclaration':
    before => Stage['filecreation'],
  }
  stage { 'filecreation':
    before => Stage['filecopy'],
  }
  stage { 'filecopy':
    before => Stage['Main'],
  }
}
