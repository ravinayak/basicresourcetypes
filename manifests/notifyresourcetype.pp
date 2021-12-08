class basicresourcetypes::notifyresourcetype(
  String $message,
) {
  notify{ 'dummy-message' :
    name     => 'dummy-message-notify',
    message  => $message,
    withpath => false,
    # /Stage[main]/Basicresourcetypes::Notifyresourcetype/Notify[dummy-message]/message: This is the full path of the object, which 
    # is displayed when we set withpath to true
    # Notice: This is a notify demo: This is displayed when withpath is set to false
  }
}
