class basicresourcetypes::scheduleresourcetype {
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
    schedule => 'monday-4am-6am-file-copy',
  }
  schedule { 'apply-to-scheduled-random-file':
    name        => 'monday-4am-6am-file-copy',
    period      => 'weekly',
    repeat      => 2,
    range       => '23:50-23:54',
    weekday     => 'Monday',
    periodmatch => 'distance'
  }
  Schedule['apply-to-scheduled-random-file'] -> File['random-file'] -> File['scheduled-random-file']
}
