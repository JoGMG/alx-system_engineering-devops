# Fixing Apache server (returning a 500 error)

exec { 'Fix wordpress site':
  provider => shell,
  command  => 'sudo sed -i "s/.phpp/.php/" /var/www/html/wp-settings.php',
}
