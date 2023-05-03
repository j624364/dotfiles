#!/usr/bin/python

import subprocess
import os
from pathlib import Path

cachefolder = str(Path.home()) + "/.cache"
cachefile = cachefolder + "/" + "layout.data"

mode = ""
default_mode = "gb"

def read_cache_file():
    global mode

    f = open(cachefile, "r")
    if f.closed:
        mode = default_mode
    else:
        mode = f.read().strip()

def write_cache_file():
    f = open(cachefile, "w")
    f.write(mode)

def set_mode():
    subprocess.run([ "setxkbmap", mode ])

read_cache_file()

if mode == "gb":
    mode = "el"
else:
    mode = "gb"

set_mode()
write_cache_file()

