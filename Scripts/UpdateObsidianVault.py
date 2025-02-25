#!/usr/bin/python

import subprocess
import datetime
import os

obsidian_vault_directory = "/home/joe/Obsidian/default"

def main():
    global obsidian_vault_directory
    os.chdir(obsidian_vault_directory)

    subprocess.run([ "git", "add", "." ])

    # i know you can format it properly 
    current_datetime = datetime.datetime.now()
    update_datetime = current_datetime.strftime("%Y-%m-%d %H:%M:%S")
    subprocess.run([ "git", "commit", "-m", f"Automatic Update {update_datetime}" ])

    subprocess.run([ "git", "push" ])

if __name__ == "__main__":
    main()

