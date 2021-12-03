include stdlib
class packageresourcetype(){
  package{'tmux':
    ensure => installed,
  }
  package { 'wget':
    ensure => installed,
  }
}
