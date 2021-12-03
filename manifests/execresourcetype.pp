class basicresourcetypes::execresourcetype {
  exec{'command to update respositories':
    command   => 'apt-get update -y',
    path      => ['/usr/bin', '/usr/local/sbin', '/usr/local/bin'],
    notify    => Exec['command to upgrade for distribution'],
    logoutput => true,
  }
  exec{'command to upgrade for distribution':
    command     => 'apt-get dist-upgrade -y',
    path        => ['/usr/bin', '/usr/local/sbin', '/usr/local/bin'],
    refreshonly => true,
    timeout     => 0,
    logoutput   => true,
  }
}
