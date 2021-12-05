class basicresourcetypes::resourcesresourcetype{
      group {'managed-group-by-puppet':
      ensure => present,
      gid    => 25001,
      system => false,
    }
    user { 'managed-by-puppet':
      ensure => present,
      uid    => 1001,
      gid    => 25001,
    }
    resources { 'user-management':
      name               => 'user',
      purge              => true,
      noop               => true,
      unless_system_user => true,
      #unless_uid         => 1001,
    }
    User['managed-by-puppet'] -> Resources['user-management']
}
