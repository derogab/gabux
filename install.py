#!/usr/bin/env python
import os
import getpass

print('Gabux started by '+getpass.getuser()+'.')
print('Installing gabux..')

# Get requirements
print('Downloading all requirements..')
out = os.popen('sudo apt-get install git').read()

# Clear any old files
if os.path.isdir('/tmp/gabux') == True:
    print('Clear old files..')
    out = os.popen('sudo rm -r /tmp/gabux').read()
    pass

# Download gabux from github
print('Downloading last version of gabux..')
out = os.popen('sudo git clone https://github.com/derogab/gabux.git /tmp/gabux').read()
print('Gabux source downloaded.');

# Clear any old versions
if os.path.isdir('/usr/share/gabux') == True:
    print('Clear old versions..')
    out = os.popen('sudo rm -r /usr/share/gabux').read()
    pass

# Copy folder in the system
out = os.popen('sudo cp -R /tmp/gabux /usr/share/').read()
print('Sub-commands installed.');

# Create /bin
out = os.popen('sudo mkdir /usr/share/gabux/bin').read()
print('Temporary folders created.')

# Create custom command
out = os.popen('sudo chmod +x /tmp/gabux/gabux.sh').read()
out = os.popen('sudo cp /tmp/gabux/gabux.sh /usr/bin/gabux').read()
print('Gabux command installed.')

# Clean garbage
print('Almost done.')
out = os.popen('sudo rm -r /tmp/gabux').read()

print('Gabux successfully installed.')
