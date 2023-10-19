# Increase the file descriptor limit for a user.

exec { 'Increase User Soft Limit':
    provider => shell,
    command  => 'echo -e "holberton\t soft\t nofile\t 4000" >> /etc/security/limits.conf',
    before   => Exec['Increase User Hard Limit'],
}

exec { 'Increase User Hard Limit':
    provider => shell,
    command  => 'echo -e "holberton\t hard\t nofile\t 5000" >> /etc/security/limits.conf',
}
