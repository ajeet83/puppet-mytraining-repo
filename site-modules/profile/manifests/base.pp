# Class: name
#
#
class profile::base {
  # resources
  package { 'curl':
    ensure => installed,
  }
}
