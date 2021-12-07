class basicresourcetypes::tidyresourcetype {
  include basicresourcetypes::tidyfiles::stagetidyfiles
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
