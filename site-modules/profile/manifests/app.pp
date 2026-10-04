# Class: name
#
#
class profile::app {
  # resources
  file { '/etc/myapp':
    ensure => directory,
  }
  file { '/etc/myapp/app.conf':
    ensure  => file,
    content => template('profile/app.conf.erb'),
    require => File['/etc/myapp'],
  }
}
