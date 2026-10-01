# Class: name
#
#
class role::web {
  # resources
  include profile::nginx
  include profile::base
  include motd
}
