# Using Puppet, install flask from pip3.
# Requirements:
# - Install flask
# - Version must be 2.1.0

package { 'install flask from pip3':
  ensure   => '2.1.0',
  name     => 'flask',
  provider => 'pip3',
}
