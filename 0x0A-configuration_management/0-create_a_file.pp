# Using Puppet, create a file in /tmp.
# Requirements:
# - File path is /tmp/school
# - File permission is 0744
# - File owner is www-data
# - File group is www-data
# - File contains I love Puppet

file { 'create or update file with these configs':
  ensure  => present,
  path    => '/tmp/school'
  mode    => '0744',
  owner   => 'www-data',
  group   => 'ww-data',
  content => 'I love Puppet'
}
