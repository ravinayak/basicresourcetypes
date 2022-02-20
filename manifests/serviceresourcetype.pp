class basicresourcetypes::serviceresourcetype(
  String $ensure_installed=installed,
) {
  package { 'nginx':
    ensure        => $ensure_installed,
    name          => 'nginx',
    provider      => 'apt',
    allow_virtual => true,
    configfiles   => replace,
  }

  file { '/tmp/refresh-nginx.txt':
    ensure  => file,
    content => 'This is a dummy configuration file simply to send refersh event to nginx',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    notify  => Service['nginx']
  }
  $ensure_running = $ensure_installed ? {
    installed => running,
    latest    => running,
    purged    => stopped,
    absent    => stopped,
    default   => running,
  }
  service { 'nginx-service':
    ensure     => $ensure_running,
    name       => 'nginx',
    enable     => true,
    hasrestart => true,
    #restart    => 'sudo touch /tmp/restart.txt && sudo /etc/init.d/nginx restart',
    hasstatus  => true,
    #status     => 'sudo touch /tmp/status.txt && sudo /etc/init.d/nginx status',
    # start      => 'sudo touch /tmp/start.txt && sudo /etc/init.d/nginx start',
    # stop       => 'sudo touch /tmp/stop.txt && sudo /etc/init.d/nginx stop',
    timeout    => 300,
  }
  # Even if hasrestart is true or hasstatus is true, this service seems to use the commands given by status,restart. In any case it is 
  # illogical to assign hasrestart or hasstatus to true, wanting systemd to execute the commands, and still provide init script's commands
  # Another thing to mention is that stop is never called if hasrestart=false, restart is not given. In this case, if the service is 
  # running, it is left to that state (provided we wanted the state to be running). stop and then start is not executed. But if service 
  # is stopped, then start is surely called. What would happen if we changed ensure to stopped and did the same experiment.
  # start, stop commands should ideally never be used. If you are in a situation where you have to use these commands, look for another
  # alternative which can be used for the functionality you want
  Package['nginx'] -> File['/tmp/refresh-nginx.txt']
}
