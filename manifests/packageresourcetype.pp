class basicresourcetypes::packageresourcetype(
  String $ensure_val=present,
  String $ensure_installed=installed,
) {
    exec { 'ls-send-refresh-event':
      command => 'ls',
      path    => ['/usr/bin', '/usr/local/sbin', '/usr/local/bin'],
      cwd     => '/etc/puppetlabs/code/environments/production/',
    }
    package{'tmux':
      ensure               => $ensure_installed,
      reinstall_on_refresh => true,
      configfiles          => keep,
    }
    package { 'wget':
      ensure               => $ensure_installed,
      reinstall_on_refresh => false,
      configfiles          => replace,
    }
    package { 'apache2':
      ensure               =>  $ensure_installed, # >2.3.0 <2.6.0 #'2.4.41-4ubuntu3.8',
      reinstall_on_refresh => true,
    }
    Exec['ls-send-refresh-event'] ~> Package['tmux', 'apache2', 'wget']
    # resinstall_on_refresh does not seem to work correctly, configfiles should always be backed up before doing any upgrade
    # actually thw whole box should be, so we can revert it if needed, Individual backups are not very efficient in such cases

    $install_status = $ensure_val ? {
      present   => latest,
      absent    => absent,
      default   => latest,
    }
    package { 'ruby':
      ensure   => $install_status,
      provider => 'apt',
    }
    $version = $ensure_val?{
      'present' => '2.4.41-4ubuntu3.6',
      'absent'  => absent,
      default   => '2.4.41-4ubuntu3.6',
    }
    archive { 'apache2-ubuntu-security':
      ensure  => $ensure_val,
      extract => false,
      source  => 'http://security.ubuntu.com/ubuntu/pool/main/a/apache2/apache2_2.4.41-4ubuntu3.6_amd64.deb',
      cleanup => false,
      path    => '/tmp/apache2_2.4.41-4ubuntu3.6_amd64.deb'
    }
    package { 'apache2bin':
      ensure      => $version,
      name        => 'apache2-bin',
      provider    => 'apt',
      configfiles => replace,
    }
    package { 'apache2data':
      ensure      => $version,
      name        => 'apache2-data',
      provider    => 'apt',
      configfiles => replace,
    }
    package { 'apache2utils':
      ensure      => $version,
      name        => 'apache2-utils',
      provider    => 'apt',
      configfiles => replace,
    }
    package { 'apache2-by-dpkg':
      ensure      => $ensure_val,
      name        => 'apache2',
      provider    => 'dpkg',
      configfiles => 'replace',
      source      => '/tmp/apache2_2.4.41-4ubuntu3.6_amd64.deb',
    }
    exec { 'fix-broken-install':
      command => 'apt --fix-broken install -y',
      path    => ['/usr/bin', '/usr/local/sbin', 'usr/local/bin'],
      user    => 'root',
      unless  => 'test -f /lib/systemd/system/apache2.service',
    }
    file {'apache2.deb':
      ensure => absent,
      path   => '/tmp/apache2_2.4.41-4ubuntu3.6_amd64.deb'
    }
    Package['apache2bin', 'apache2data', 'apache2utils'] -> Exec['fix-broken-install'] -> Package['apache2-by-dpkg'] -> File['apache2.deb']

    package { 'mysql':
      ensure   => $ensure_installed,
      provider => gem,
      command  => '/opt/puppetlabs/puppet/bin/gem',
      name     => 'mysql-gem'
    }
    package { 'mysql db':
      ensure => $ensure_installed,
      name   => 'mysql-client',
    }
    package { 'musql gem ruby':
      ensure   => $ensure_installed,
      provider => gem,
      command  => '/usr/bin/gem',
      name     => 'mysql-gem'
    }
}
