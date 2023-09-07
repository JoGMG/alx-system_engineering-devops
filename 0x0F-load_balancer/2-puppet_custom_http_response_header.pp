# Install an Nginx server with custom HTTP header

exec {'update':
  provider => shell,
  command  => 'sudo apt-get -y update',
  before   => Exec['install Nginx'],
}

exec {'install Nginx':
  provider => shell,
  command  => 'sudo apt-get -y install nginx',
  before   => Exec['custom_header'],
}

exec { 'custom_header':
  provider    => shell,
  environment => ["var=${hostname}"],
  command     => 'sudo sed -i -E "s/^server \{/server \{\n\tadd_header X-Served-By "$var";/" /etc/nginx/sites-available/default',
  before      => Exec['restart Nginx'],
}

exec { 'restart Nginx':
  provider => shell,
  command  => 'sudo service nginx restart',
}
