include stdlib
class basicresourcetypes::fileresourcetype{
  $path_pl_repo = '/etc/puppetlabs/code/environments/production/puppet-learning/manifests'
  file {'soure file':
    path    => "${path_pl_repo}/source_file",
    content => 'This is a file which acts as source',
    owner   => 'vagrant',
    group   => 'vagrant',
    mode    => '0644',
    ensure  => file,
  }

  file { 'logfile1':
    path   => "${path_pl_repo}/out1.txt",
    mode   => '0644',
    owner  => 'vagrant',
    group  => 'vagrant',
    source => "${path_pl_repo}/source_file",
    ensure => file,
  }
  file{ 'logfile2':
    path   => "${path_pl_repo}/out2.txt",
    mode   => '0644',
    owner  => 'vagrant',
    group  => 'vagrant',
    source => "${path_pl_repo}/source_file",
    ensure => file,
  }
  file {'copy of tmux keyboard bindings':
    ensure    => absent,
    path      => '/home/bob/tmux-keyboard-bindings.conf',
    source    => '/usr/share/byobu/keybindings/tmux-screen-keys.conf',
    mode      => '0644',
    owner     => 'vagrant',
    group     => 'vagrant',
    show_diff => true,
  }
  file{'symbolic link example':
    ensure => link,
    target => '/etc/puppetlabs/code/environments/production/puppet-learning/manifests',
    path   => '/home/vagrant/manifestslink',
    mode   => '0755',
    owner  => 'vagrant',
    group  => 'vagrant',
  }
  File['logfile1'] -> File['logfile2']
  File["${path_pl_repo}/out1.txt"] ~> File["${path_pl_repo}/out2.txt"]
}
