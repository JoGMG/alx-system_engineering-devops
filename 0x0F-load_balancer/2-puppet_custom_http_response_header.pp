# Install an Nginx server with custom HTTP header

package { 'nginx':
  ensure => 'present',
}

# exec {'update':
#   provider => shell,
#   command  => 'sudo apt-get -y update',
#   before   => Exec['install Nginx'],
# }

# exec {'install Nginx':
#   provider => shell,
#   command  => 'sudo apt-get -y install nginx',
#   before   => Exec['add_header'],
# }

file_line { 'add custom header':
  ensure      => 'present',
  path        => '/etc/nginx/sites-available/default',
  environment => ["var=${hostname}"],
  after       => 'server {',
  line        => '\n\tadd_header X-Served-By "$var";',
}
# exec { 'add_header':
#   provider    => shell,
#   environment => ["HOST=${hostname}"],
#   command     => 'sudo sed -i "s/include \/etc\/nginx\/sites-enabled\/\*;/include \/etc\/nginx\/sites-enabled\/\*;\n\tadd_header X-Served-By \"$HOST\";/" /etc/nginx/nginx.conf',
#   before      => Exec['restart Nginx'],
# }

exec { 'restart Nginx':
  provider => shell,
  command  => 'sudo service nginx restart',
}
