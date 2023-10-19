# Increase the file descriptor limit for a user.

exec {'replace-1':
  provider => shell,
  command  => 'sudo sed -i "/holberton\s*\(hard\|soft\)/s/\(5\|4\)/5000/" /etc/security/limits.conf',
}
