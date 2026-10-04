# Class: name
#
#
class profile::packages {
  package { 'vim':
    ensure => installed,
  }
}
