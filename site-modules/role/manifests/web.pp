# Class: name
#
#
class role::web {
  # resources
  include profile::nginx
  include profile::app
  include profile::base
  include profile::gropus
  include profile::files
  include profile::packages
  include profile::users
  include motd
}
