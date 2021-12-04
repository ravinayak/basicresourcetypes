class basicresourcetypes::groupresourcetype(
  Array[Hash[String, Variant[String, Integer]]] $users,
) {
    $users.each |$user_hash| {
      user { $user_hash['name']:
        ensure         => absent,
        comment        => "Test user :: ${user_hash['name']}",
        uid            => $user_hash['uid'],
        allowdupe      => false,
        membership     => minimum,
        groups         => $user_hash['groups'],
        purge_ssh_keys => true,
        shell          => '/bin/bash',
      }
    }
    group { 'group1 - members - [test-user-1, test-user-2]':
      ensure    => absent,
      name      => 'group1',
      gid       => 1015,
      allowdupe => false,
      #members   => ['tom', 'dick'],
      system    => false,
    }
    group { 'group2 - members - [test-user-2, test-user-3]':
      ensure    => absent,
      name      => 'group2',
      gid       => 1016,
      allowdupe => false,
      system    => false,
    }
    group { 'group3 - members - [test-user-3, test-user-1]':
      ensure    => absent,
      name      => 'group3',
      gid       => 1017,
      allowdupe => false,
      system    => false,
    }
    Group['group1', 'group2', 'group3'] ~> User['test-user-1', 'test-user-2', 'test-user-3']
}

Class { 'basicresourcetypes::groupresourcetype':
  users => [
    {
      name   => 'test-user-1',
      uid    => 3001,
      groups => 'group3',
      gid    => 1015,
    },
        {
      name   => 'test-user-2',
      uid    => 3001,
      groups => 'group1',
      gid    => 1016
    },
        {
      name   => 'test-user-3',
      uid    => 3001,
      groups => 'group2',
      gid    => 1017
    }
  ]
}
