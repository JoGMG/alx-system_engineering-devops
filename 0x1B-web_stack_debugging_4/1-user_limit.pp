# Increase the file descriptor limit for a user.

exec {'Increase user hard and soft limits':
  provider => shell,
  command  => 'sudo sed -i "/holberton\s*\(hard\|soft\)/s/\(5\|4\)/5000/" /etc/security/limits.conf',
}
