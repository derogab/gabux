#!/usr/bin/env python
import os
import getpass
import json
import urllib2

print('Gabux started by '+getpass.getuser()+'.')

# Get dependencies
print('Downloading all requirements..')
out = os.popen('sudo apt-get install git').read() # git is required to download update file

# Control version.json
print('Checking versions..')
#url = "https://raw.githubusercontent.com/derogab/gabux/master/config.json"
url = "https://raw.githubusercontent.com/derogab/gabux/dev/config.json"
response = urllib2.urlopen(url)
remote_data = response.read()
remote_config = json.loads(remote_data)
with open('config.json') as local_data:
    local_config = json.load(local_data)

if remote_config['version'] != local_config['version']:
    print('Your version is Gabux '+local_config['version']
    +'\nLast version is Gabux '+remote_config['version']
    +'\nAn update is required. The update is about to start..'
    +'\nUpdating gabux..')

    # Clear any old files
    if os.path.isdir('/tmp/gabux') == True:
        print('Clear old files..')
        out = os.popen('sudo rm -r /tmp/gabux').read()
        pass

    # Download gabux from github
    print('Downloading last version of gabux..')
    out = os.popen('sudo git clone https://github.com/derogab/gabux.git /tmp/gabux').read()
    print('Gabux source downloaded.');

    # Remove old commands and bin
    if os.path.isdir('/usr/share/gabux/bin') == True:
        out = os.popen('sudo rm -r /usr/share/gabux/bin').read()
        pass
    if os.path.isdir('/usr/share/gabux/commands') == True:
        out = os.popen('sudo rm -r /usr/share/gabux/commands').read()
        pass

    # Copy folder in the system
    out = os.popen('sudo cp -R /tmp/gabux /usr/share/').read()
    print('Sub-commands installed.')

    # Create /bin
    out = os.popen('sudo mkdir /usr/share/gabux/bin').read()
    print('Temporary folders created.')

    # Clean garbage
    print('Almost done.')
    out = os.popen('sudo rm -r /tmp/gabux').read()

    # End
    print('Gabux successfully updated.')
    print('Gabux '+remote_config['version']+' installed.')

    pass
else:
    print('Your gabux version is up to date.')
    pass
