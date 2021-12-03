class basicresourcetypes::directorycreationfileresourcetype {
  $parent_dir_path = 'testA/testB/testC/testD'
  user{ 'bob':
    name       => 'bob',
    managehome => true,
    comment    => 'Hey! I am bob',
    shell      => '/usr/bin/bash',
    ensure     => present,
  }
  exec{'command to create directories hierarchy':
    command   => "mkdir -p ${parent_dir_path}",
    path      => ['/usr/bin', '/usr/local/bin', '/usr/sbin'],
    creates   => "/home/bob/${parent_dir_path}",
    notify    => File['testfile1 creation', 'testfile2 creation', 'testfile3 creation'],
    timeout   => 200,
    logoutput => true,
    cwd       => '/home/bob'
  }
  file{ 'test directory creation':
    ensure       => directory,
    purge        => true,
    #force        => true,
    recurse      => true,
    recurselimit => 5,
    owner        => 'bob',
    group        => 'bob',
    mode         => '0644',
    path         => "/home/bob/${parent_dir_path}/testE"
  }
  file{ 'testfile1 creation':
    ensure => file,
    owner  => 'bob',
    group  => 'bob',
    mode   => '0644',
    path   => "/home/bob/${parent_dir_path}/testE/testfile1.txt",
    notify => File['testfile2 creation'],
  }
  file{ 'testfile2 creation':
    ensure => file,
    owner  => 'vagrant',
    group  => 'vagrant',
    mode   => '0644',
    path   => "/home/bob/${parent_dir_path}/testE/testfile2.txt",
    notify => File['testfile3 creation'],
  }
  file{ 'testfile3 creation':
    ensure => file,
    owner  => 'vagrant',
    group  => 'vagrant',
    mode   => '0644',
    path   => "/home/bob/${parent_dir_path}/testE/testfile3.txt",
    notify => Exec['command to list testE directory contents-1', 'command to list testE directory contents-2'],
  }
  exec{'command to list testE directory contents-1':
    command   => "ls -al /home/bob/${parent_dir_path}/testE > out.txt",
    path      => ['/usr/bin', '/usr/local/bin', '/usr/sbin'],
    timeout   => 200,
    logoutput => true,
    cwd       => '/home/bob',
  }
  exec{'command to list testE directory contents-2':
    command   => "ls -al /home/bob/${parent_dir_path}/testE >> out.txt",
    path      => ['/usr/bin', '/usr/local/bin', '/usr/sbin'],
    timeout   => 200,
    logoutput => true,
    cwd       => '/home/bob'
  }
  User['bob'] -> Exec['command to create directories hierarchy'] -> File['test directory creation']
  File['testfile1 creation'] -> Exec['command to list testE directory contents-1']
}
