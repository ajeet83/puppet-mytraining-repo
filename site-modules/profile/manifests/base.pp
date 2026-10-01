# Class: name
#
#
class profile::base {
  case $facts['os']['family'] {
    'Debian': {
      # Covers Ubuntu, Debian
      package { 'curl':
        ensure   => installed,
        provider => 'apt',
      }
    }
    'RedHat': {
      # Covers CentOS, RHEL, Fedora, Rocky, AlmaLinux
      package { 'curl':
        ensure   => installed,
        provider => 'yum',
      }
    }
    'Windows': {
      # Example: use Chocolatey for Windows
      package { 'curl':
        ensure   => installed,
        provider => 'chocolatey',
      }
    }
    'Darwin': {
      # macOS
      package { 'curl':
        ensure   => installed,
        provider => 'homebrew',
      }
    }
    default: {
      notify { "Unsupported OS family: ${facts['os']['family']}": }
    }
  }
}

