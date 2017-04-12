#!/usr/bin/python

#import os
#import sys
#import tempfile
#import re
#import socket
#from datetime import datetime
#import time

import apt
#import apt_pkg

#import perform

def upgradable(distupgrade=False, get_names_only=True):
    "Checks if the system is upgradable."
    cache = apt.Cache()
    cache.upgrade(distupgrade)
    pkg = cache['bluez'] # Access the Package object for python-apt
    print(pkg.candidate.origins)

    if get_names_only:
        packages = [package.name for package in cache.get_changes()]
    else:
        packages = [package for package in cache.get_changes()]
    return packages

def show_package_versions():
    cache = apt.Cache()
    cache.upgrade(True)

    #pkg = cache['xbian-package-xbmc'] # Access the Package object for python-apt
    #print(pkg.candidate.origins)

    packages = [package for package in cache.get_changes()]

    if packages:
        for package in sorted(packages):
            pkg = cache[package.name]
            print ("{}/{} {} upgradeable to {}".format(
                package.name,
                pkg.candidate.origins[0].archive,
                #pkg.candidate.origins[0].component,
                package.installed.version,
                package.candidate.version,
            ))
    return packages

if __name__ == "__main__":
    show_package_versions()
