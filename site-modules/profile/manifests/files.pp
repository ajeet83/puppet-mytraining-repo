# Class: name
#
#
class profile::files {
  # resources
  file { '/opt/myapp':
    ensure => directory,
    owner  => 'appuser',
    group  => 'appgroup',
    mode   => '0755'
  }

  file { '/opt/myapp/config.txt':
    ensure  => file,
    content => "environment=production\n",
    owner   => 'appuser',
    group   => 'appgroup',
    mode    => '0644'
  }
}
