class basicresourcetypes::notifyresourcetype(
  String $message,
) {
  notify{ 'dummy-message' :
    name     => 'dummy-message-notify',
    message  => $message,
    withpath => false,
  }
}
