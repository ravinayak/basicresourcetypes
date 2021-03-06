class basicresourcetypes::groupresourcetype(
  String $ensure_val,
  Array[Hash[String, Variant[String, Integer]]] $users,
) {
    group { 'group1':
      ensure    => $ensure_val,
      #name      => 'group1-test',
      gid       => 10220,
      allowdupe => false,
      #members   => ['tom', 'dick'],
      system    => false,
    }
    group { 'group2':
      ensure    => $ensure_val,
      #name      => 'group2-test',
      gid       => 10221,
      allowdupe => false,
      system    => false,
    }
    group { 'group3':
      ensure    => $ensure_val,
      #name      => 'group3-test',
      gid       => 10222,
      allowdupe => false,
      system    => false,
    }
    $users.each |$user_hash| {
      user { $user_hash['name']:
        ensure         => $ensure_val,
        comment        => "TestUser-${user_hash['name']}",
        uid            => $user_hash['uid'],
        allowdupe      => false,
        membership     => minimum,
        groups         => $user_hash['groups'],
        purge_ssh_keys => true,
        shell          => '/bin/bash',
      }
    }
    $names_arr = $users.reduce([]) |$result, $user_hash| { $result << $user_hash['name'] }
    $group_name_hash = $users.reduce({}) |$result, $user_hash| { $result.merge($user_hash['name'] => $user_hash['gid']) }
    $file_ensure = $ensure_val ? {
      present => directory,
      absent  => absent,
      default => directory,
    }
    $names_arr.each |$name| {
      file { "/home/${name}":
        ensure => $file_ensure,
        owner  => $name,
        force  => true,
        group  => $group_name_hash[$name],
        mode   => '0755'
      }
    }
    Group['group1', 'group2', 'group3'] ~> User[$names_arr]
}
