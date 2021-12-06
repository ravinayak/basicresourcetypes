class basicresourcetypes::scheduleresourcetype(
  String $schedule_range,
) {
  schedule { 'maintenance-window':
    name    => 'weekly-nighttime-maintenance',
    period  => 'weekly',
    range   => '22:00-02:00',
    repeat  => 1,
    weekday => 'Saturday',
  }

  file { 'random-file':
    ensure  => file,
    path    => '/tmp/random-file.txt',
    content => 'Hi! this is a random file used as source for another file',
    mode    => '0644',
    owner   => 'vagrant',
    group   => 'vagrant',
  }

  file { 'scheduled-random-file':
    ensure   => file,
    path     => '/tmp/scheduled-random-file.txt',
    source   => '/tmp/random-file.txt',
    mode     => '0644',
    owner    => 'vagrant',
    group    => 'vagrant',
    schedule => 'hourly-60-times-schedule',
  }
  schedule { 'hourly-60-times-schedule':
    name        => 'monday-4am-6am-file-copy',
    period      => 'hourly',
    repeat      => 60,
    range       => $schedule_range,
    weekday     => 'Monday',
    periodmatch => 'distance',
  }
  exec { '/usr/bin/ls /etc/puppetlabs/code/environments/production/puppet-learning/':
    schedule => 'hourly-60-times-schedule',
  }

  File['random-file'] -> File['scheduled-random-file']
}
