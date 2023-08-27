# our machine has an SSH configuration file for the local SSH client,
# let’s configure it to our needs so that you can connect to a server
# without typing a password. Share your SSH client configuration in
# your answer file.
# Requirements:
# - Your SSH client configuration must be configured to use the
#   private key ~/.ssh/school
# - Your SSH client configuration must be configured to refuse
#   to authenticate using a password

IdentityFile ~/.ssh/school
PasswordAuthentication no