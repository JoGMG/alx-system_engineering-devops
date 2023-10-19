# Increasing maximum number of open file descriptors allowed by nginx server.

exec { 'Replaces ULIMIT value':
    provider => shell,
    command  => 'sudo sed -i "s/^ULIMIT=.*/ULIMIT=\"-n 4096\"/" /etc/default/nginx',
    before   => Exec['restart nginx'],
}

exec { 'restart nginx':
    provider => shell,
    command  => 'sudo service nginx restart',
}
