#!/usr/bin/env python
import os
import getpass

print('Gabux started by '+getpass.getuser()+'.')
print('Removing gabux..')

# Remove gabux folder
print('Deleting gabux folder..')
out = os.popen('sudo rm -r /usr/share/gabux').read()
# Remove gabux bash command
print('Removing gabux bash command..')
out = os.popen('sudo rm -r /usr/bin/gabux').read()

print('Gabux successfully removed.')
print('Today is a sad day.')
