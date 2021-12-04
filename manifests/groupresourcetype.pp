class basicresourcetypes::groupresourcetype(
  Array[Hash[String, Variant[String, Integer]]] $users,
) {
    $users.each |$user_hash| {
      user { $user_hash['name']:
        ensure         => present,
        comment        => "Test user :: ${user_hash['name']}",
        uid            => $user_hash['uid'],
        allowdupe      => false,
        membership     => minimum,
        groups         => $user_hash['groups'],
        purge_ssh_keys => true,
        shell          => '/bin/bash',
      }
    }
    group { 'group1':
      ensure    => present,
      name      => 'group1 - members - [test-user-1, test-user-2]',
      gid       => 1015,
      allowdupe => false,
      #members   => ['tom', 'dick'],
      system    => false,
    }
    group { 'group2':
      ensure    => present,
      name      => 'group2 - members - [test-user-2, test-user-3]',
      gid       => 1016,
      allowdupe => false,
      system    => false,
    }
    group { 'group3':
      ensure    => present,
      name      => 'group3 - members - [test-user-3, test-user-1]',
      gid       => 1017,
      allowdupe => false,
      system    => false,
    }
    $names_arr = $users.reduce([]) |$result, $user_hash| { $result << $user_hash['name'] }
    Group['group1', 'group2', 'group3'] ~> User[$names_arr]
}
