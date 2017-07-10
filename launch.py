#!/usr/bin/env python

# Requirements
import os
import getpass
import sys

# Redirect to command with arguments
command = sys.argv[1]
args = sys.argv[2:]
arguments = " ".join(args)

os.system('bash /usr/share/gabux/commands/'+command+'/'+command+'.sh '+arguments)
exit()
