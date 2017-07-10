#!/usr/bin/env python

# Requirements
import os
import getpass
import optparse
import sys

# Initialize
parser = optparse.OptionParser()

# Powers
def update(option, opt_str, value, parser, *args, **kwargs):
    os.system('./update.py')
    exit()
    pass
    # update()

def install(option, opt_str, value, parser, *args, **kwargs):
    os.system('./install.py')
    exit()
    pass
    # install()

def uninstall(option, opt_str, value, parser, *args, **kwargs):
    os.system('./remove.py')
    exit()
    pass
    # uninstall()

def launch(option, opt_str, value, parser, *args, **kwargs):
    print('Gabux started by '+getpass.getuser()+'.')
    arguments = ' '.join(parser.rargs)
    os.system('./launch.py '+arguments)
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

os.system('./gabux.py --help')
