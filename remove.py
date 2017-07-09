#!/usr/bin/env python
import os
import getpass

print('Gabux started by '+getpass.getuser()+'.')
print('Removing gabux..')

# Remove gabux folder
if os.path.isdir('/usr/share/gabux') == True:
    print('Deleting gabux folder..')
    out = os.popen('sudo rm -r /usr/share/gabux').read()
    pass
# Remove gabux bash command
if os.path.isdir('/usr/bin/gabux') == True:
    print('Removing gabux bash command..')
    out = os.popen('sudo rm -r /usr/bin/gabux').read()
    pass

print('Gabux successfully removed.')
print('Today is a sad day.')
