# Time to practice configuring your server with Puppet! Just as you did before, we’d like you to install and configure an Nginx server using Puppet instead of Bash. To save time and effort, you should also include resources in your manifest to perform a 301 redirect when querying /redirect_me.

# Requirements:

# Nginx should be listening on port 80
# When querying Nginx at its root / with a GET request ##(requesting a page) using curl, it must return a page that contains the string Hello World!
# The redirection must be a “301 Moved Permanently”
# Your answer file should be a Puppet manifest containing commands to automatically configure an Ubuntu machine to respect above requirements

package { 'nginx is installed':
  ensure => 'installed',
}

file_line { 'nginx server config':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => 'return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;',
}

file { 'index file':
  path    => '/var/www/html/index.html',
  content => 'Hello World!',
}

service { 'nginx is running':
  ensure => 'running',
  name   => 'nginx',
}
