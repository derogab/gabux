#!/usr/bin/env python
import json

def check():
    print('Checking version of gabux..')
    version = get()
    print('Gabux '+str(version))
    pass

def get():
    with open('/usr/share/gabux/version.json') as local_data:
        local_config = json.load(local_data)
    version = local_config['version']
    return version
    pass
