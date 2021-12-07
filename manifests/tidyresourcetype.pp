include basicresourcetypes::tidyfiles::stagetidyfiles
class basicresourcetypes::tidyresourcetype {
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
