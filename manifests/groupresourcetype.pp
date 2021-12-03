class basicresourcetypes::groupresourcetype {
  $users=['tom', 'dick', 'harry']
  user{$users:
    ensure         => present,
    comment        => 'this is a test user for testing groups',
    uid            => fqdn_rand(1001,1050, 'seed string'),
    allowdupe      => false,
    membership     => minimum,
    purge_ssh_keys => true,
    shell          => '/bin/bash',
  }
  group{ 'group1 creation - members - [tom, dick]':
    ensure          => present,
    name            => 'group1',
    gid             => 1015,
    allowdupe       => false,
    auth_membership => false,
    members         => ['tom', 'dick'],
    system          => false,
  }
  group { 'group2 creation - members - [dick, harry]':
    ensure          => present,
    name            => 'group2',
    gid             => 1016,
    allowdupe       => false,
    auth_membership => false,
    members         => ['dick','harry'],
    system          => false,
  }
  group { 'group3 creation - members - [harry,tom]':
    ensure          => present,
    name            => 'group3',
    gid             => 1017,
    allowdupe       => false,
    auth_membership => false,
    members         => ['harry', 'tom'],
    system          => false,
  }
}
