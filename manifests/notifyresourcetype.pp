class basicresourcetypes::notifyresourcetype(
  String $message,
) {
  notify{ 'dummy-message' :
    name     => 'dummy-message-notify',
    message  => $message,
    withpath => true,
  }
}
Class{ 'basicresourcetypes::notifyresourcetype':
  message => 'This is a notify demo',
}
