# Increase the file descriptor limit for a user.

exec { 'Increase User Soft Limit':
    provider => shell,
    command  => 'sudo sed -Ei '/holberton\s*(hard|soft)/s/(4|5)/5000/' /etc/security/limits.conf',
}
