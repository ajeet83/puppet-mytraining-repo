# Class: name
#
#
class motd (String $message = 'Hi') {
  file { '/etc/motd':
    ensure  => file,
    content => template('motd/motd.erb'),
  }
}
