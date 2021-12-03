class basicresourcetypes::packageresourcetype {
  package{'tmux':
    ensure => installed,
  }
  package { 'wget':
    ensure => installed,
  }
}
