class basicresourcetypes::tidyresourcetype {
  stage { 'filecreationdeclaration':
    before => Stage['filecopy'],
  }
  stage { 'filecopy':
    before => Stage['main'],
  }
  Class {'basicresourcetypes::tidyfiles::filecreationdeclaration':
    stage => Stage['filecreationdeclaration']
  }
  Class {'basicresourcetypes::tidyfiles::filecopy':
    stage => Stage['filecopy']
  }
  Class {'basicresourcetypes::tidyfiles::tidyfilesdemo':
    stage => Stage['main']
  }
}
