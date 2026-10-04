# Class: name
#
#
class profile::users {
  # resources
  user { 'appuser':
    ensure     =>present,
    uid        => 2026,
    gid        => 'appgroup',
    shell      =>'/bin/bash',
    home       =>'/home/appuser',
    managehome => true,
    require    => Group['appgroup']
  }
}
