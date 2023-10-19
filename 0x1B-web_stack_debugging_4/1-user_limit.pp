# Increase the file descriptor limit for a user.

exec { 'Increase User Soft Limit':
    provider => shell,
    command  => 'sudo sed -Ei '/holberton\s*(hard|soft)/s/\d+/5000/' /etc/security/limits.conf',
}
