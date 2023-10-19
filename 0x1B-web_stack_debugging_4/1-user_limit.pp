# Increase the file descriptor limit for a user.

exec {'replace-1':
  provider => shell,
  command  => 'sudo sed -i "s/nofile \(5\|4\)/nofile 5000/" /etc/security/limits.conf',
}
