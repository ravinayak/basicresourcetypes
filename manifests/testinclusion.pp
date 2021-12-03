class basicresourcetypes::testinclusion {
  include basicresourcetypes::directorycreationfileresourcetype
  include basicresourcetypes::packageresourcetype
  include basicresourcetypes::execresourcetype
  include basicresourcetypes::fileresourcetype
  notice('I am here')
}
include basicresourcetypes::testinclusion
