class basicresourcetypes::tidyfiles::stagetidyfiles {
  stage { 'filecopy':
    before => Stage['Main'],
  }
  stage { 'filecreation':
    before => Stage['filecopy'],
  }
  stage { 'filecreationdeclaration':
    before => Stage['filecreation'],
  }
}
