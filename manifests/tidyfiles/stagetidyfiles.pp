class basicresourcetypes::tidyfiles::stagetidyfiles {
  stage { 'filecreationdeclaration':
    before => Stage['Main'],
  }
  ->stage { 'filecopy':
    before => Stage['Main'],
  }
}
