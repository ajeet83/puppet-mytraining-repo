# Class: name
#
#
class profile::groups{
  group { 'appgroup':
    ensure => present,
    gid    => 2026
  }
}
