# Increase the file descriptor limit for a user

exec { 'Add to User-Specific Config file'
    provider => shell,
    command  => 'echo 'holberton soft nofile 65535' >> /etc/security/limits.conf',
}
