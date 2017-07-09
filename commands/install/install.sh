#! /bin/bash
echo "Searching setup file..";

# $1 is the command 'install'
# $2 is the name of software I want install
if [ -z "$2" ]; then
  # $2 is unset
  echo "Error: command not found. Write 'gabux help install' for more informations.";
else
  # $2 is set

  # Search if isset $2's setup file
  if [ -f "/usr/share/gabux/commands/install/$2/$2.sh" ]; then
    # Setup file found
    # Install $2
    echo "Installing $2..";
    bash /usr/share/gabux/commands/install/$2/$2.sh;
  else
    # Setup file not found
    echo "Error: setup file not found. Read the list of available setup writing 'gabux help install'.";
  fi

fi
exit;
