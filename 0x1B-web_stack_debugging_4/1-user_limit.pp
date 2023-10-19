# Increase the file descriptor limit for a user

exec { 'Add to User-Specific Config file'
    provider => shell,
    command  => 'holberton soft nofile 5000',
    command  => 'holberton hard nofile 6000',
}
