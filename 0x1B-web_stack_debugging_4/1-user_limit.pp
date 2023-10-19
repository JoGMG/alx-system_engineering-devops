# Increase the file descriptor limit for a user.

exec { 'Increase User Soft Limit':
    provider => shell,
    command  => 'sed -Ei '/holberton\s*(hard|soft)/s/[0-9]+/5000/' /etc/security/limits.conf',
}
