#!/usr/bin/env python

# Requirements
import os
import getpass
import optparse
import sys
import json
import urllib2

# Initialize
parser = optparse.OptionParser()

# Powers
def update(option, opt_str, value, parser, *args, **kwargs):

    print('Gabux started by '+getpass.getuser()+'.')

    if os.path.isdir('/usr/share/gabux') == False:

        # Install Gabux now
        print('No version installed. Gabux is going to be installed.')
        install(option, opt_str, value, parser, *args, **kwargs)
        exit()

        pass

    # Get dependencies
    print('Downloading all requirements..')
    out = os.popen('sudo apt-get install git').read() # git is required to download update file

    # Control config.json
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

        # Upgrade gabux to the last version
        out = os.popen('sudo git -C /usr/share/gabux pull').read()

        # Create temporary folder
        if os.path.isdir('/usr/share/gabux/bin') == False:

            out = os.popen('sudo mkdir /usr/share/gabux/bin').read()
            print('Temporary folders created.')

            pass

        # End
        print('Gabux successfully updated.')
        print('Gabux '+remote_config['version']+' installed.')

        pass
    else:
        print('Your gabux version is up to date.')
        pass

    exit()
    pass
    # update()

def install(option, opt_str, value, parser, *args, **kwargs):

    print('Gabux started by '+getpass.getuser()+'.')
    print('Installing gabux..')

    # Clear any old versions
    if os.path.isdir('/usr/share/gabux') == True:

        print('Clear old versions..')
        out = os.popen('sudo rm -r /usr/share/gabux').read()

        pass

    if os.path.isdir('./commands') == True and os.path.exists('./gabux.py') == True and os.path.exists('./gabux.sh') == True:

        # Copy gabux to the system
        print('Copying files to the system..')
        out = os.popen('sudo cp -R ./ /usr/share/gabux').read()
        print('Files copied successfully.');

        pass
    else:

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

        # Copy folder to the system
        print('Copying files to the system directory..')
        out = os.popen('sudo cp -R /tmp/gabux /usr/share/').read()
        print('Files copied successfully.');

        pass

    # Create /bin
    out = os.popen('sudo mkdir /usr/share/gabux/bin').read()
    print('Temporary folders created.')

    # Create custom command
    out = os.popen('sudo chmod +x /usr/share/gabux/gabux.sh').read()
    out = os.popen('sudo cp /usr/share/gabux/gabux.sh /usr/bin/gabux').read()
    print('Gabux command installed.')

    # Clean garbage
    print('Almost done.')
    if os.path.isdir('/tmp/gabux') == True:
        print('Clear tmp files..')
        out = os.popen('sudo rm -r /tmp/gabux').read()
        pass

    print('Gabux successfully installed.')
    exit()

    pass
    # install()

def uninstall(option, opt_str, value, parser, *args, **kwargs):

    print('Gabux started by '+getpass.getuser()+'.')

    if os.path.isdir('/usr/share/gabux') == False and os.path.isdir('/usr/bin/gabux') == False:

        print('Gabux isn\'t installed.')

        pass
    else:

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

        pass

    print('Today is a sad day.')

    exit()
    pass
    # uninstall()

def launch(option, opt_str, value, parser, *args, **kwargs):
    print('Gabux started by '+getpass.getuser()+'.')
    arguments = ' '.join(parser.rargs)
    os.system('/usr/share/gabux/launch.py '+arguments)
    exit()
    pass
    # command()

parser.add_option('--update', '--upgrade',
                help="update gabux to the last version",
                action="callback",
                callback=update)

parser.add_option('--install',
                help="download and install gabux",
                action="callback",
                callback=install)

parser.add_option('--purge', '--remove',
                help="uninstall gabux",
                action="callback",
                callback=uninstall)

parser.add_option('-c', '--command',
                help="execute a gabux command",
                action="callback",
                callback=launch)

options, remainder = parser.parse_args()

# print help if no command is been selected
os.system('./gabux.py --help')
