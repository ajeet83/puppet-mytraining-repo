# Class: name
#
#
class profile::app (
  String $app_name,
  String $environment,
  Integer $app_port,
) {
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
