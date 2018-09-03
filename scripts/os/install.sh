#! /bin/bash
echo "Searching setup file..";

# $1 is the command 'os'
# $2 is the command 'install'
# $3 is the name of software I want install
if [ -z "$3" ]; then
  # $3 is unset
  echo "package name not found.";
  echo "write \"gabux help\" for more informations.";
else
  # $3 is set

  # Search if isset $3's setup file
  if [ -f "/usr/share/gabux/scripts/os/installable/$3/install.sh" ]; then # found
    # Install $3
    echo "Installing $3..";
    bash /usr/share/gabux/scripts/os/installable/$3/install.sh;
  else
    # Setup file not found
    echo "$3 not found.";
    echo "write \"gabux help\" for more informations.";
  fi

fi
exit;
