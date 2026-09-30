# Class: profile::naginx
# This profile wraps the nginx module and ensures the repo is managed.
#
# Parameters:
# - port: Integer, default 80. Defines the port nginx should listen on.
#
class profile::nginx( Integer $port = 80) {
    class { 'nginx':
        managed_repo => true
    }
}
