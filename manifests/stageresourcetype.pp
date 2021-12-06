class basicresourcetypes::stageresourcetype(
  $stage_demo=true,
) {
  stage { 'pre-stage':
    before => Stage['main'],
  }
  stage { 'post-stage':
    before => Stage['main'],
  }

  if $stage_demo {
    Class { 'basicresourcetypes::prestage::prestage1':
      stage => 'pre-stage',
    }
    Class { 'basicresourcetypes::prestage::prestage2':
      stage => 'pre-stage',
    }
    Class { 'basicresourcetypes::prestage::prestage3':
      stage => 'pre-stage'
    }
    Class {'basicresourcetypes::poststage::poststage1':
      stage => 'post-stage',
    }
    Class {'basicresourcetypes::poststage::poststage2':
      stage => 'post-stage',
    }
    Class {'basicresourcetypes::poststage::poststage3':
      stage => 'post-stage',
    }
    include basicresourcetypes::defaultmainstage::defaultmainstage1
    include basicresourcetypes::defaultmainstage::defaultmainstage2
  }


}
