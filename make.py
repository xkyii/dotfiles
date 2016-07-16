#!/usr/bin/env python

import os
import sys, getopt
import subprocess

__version__ = "0.0.1"

class Installer(object):
    def _check_output(self, cmd):
        subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)

    def _call(self, cmd):
        subprocess.call(cmd, stderr=subprocess.STDOUT, shell=True)

    def _brew_install(self, formula):
        try:
            self._check_output("brew install {}".format(formula))
        except subprocess.CalledProcessError as e:
            if "already installed" in e.output:
                print(e.output)
            else:
                raise e

    def _brew_cask_install(self, cask):
        r = subprocess.check_output("brew cask install {}".format(cask), stderr=subprocess.STDOUT, shell=True)
        print(r)

    def brew(self):
        print("install brew ...")

    def node(self):
        print("install node ...")
        self._brew_install("node")

    def dotnet(self):
        print("install dotnet ...")
        self._brew_cask_install("dotnet")
        self._call("brew link --force openssl")
        self._call("npm install -g yo bower grunt-cli gulp")
        self._call("npm install -g generator-aspnet")

    def python3(self):
        print("install python3 ...")
        self._call("anyenv install -s pyenv")
        self._call("source ~/.bashrc")
        self._call("pyenv install -s 3.5.2")
        self._call("pyenv global 3.5.2")
        self._call("pyenv rehash")

    def alfred(self):
        self._brew_cask_install("alfred")
        # fix workflow mi
        self._call("pip install requests")
        self._call("pip install decopt")
        self._call("pip install pyobjc")


def Usage():
    print("Usage of make dotfiles")
    print("-h, --help       print this help message")
    print("-v, --version    print current version")
    print("-i, --install    install package")
    print("ls               list all supportted packages")

def ls():
    print("package in my dotfiles:")
    print(" dotnet")

def main(argv):
    try:
        opts, args = getopt.getopt(argv, "hvi:", ["install="])
    except getopt.GetoptError as err:
        print(err)
        Usage()
        sys.exit(2)

    for o, arg in opts:
        if o in ("-h", "--help"):
            Usage()
            sys.exit(0)
        elif o in ("-v", "--version"):
            print("make", __version__)
        elif o in ("-i", "--install"):
            getattr(Installer(), arg)()

    for arg in args:
        if arg == "ls":
            ls()

    print("Done.")

if __name__ == '__main__':
    print(sys.version)
    main(sys.argv[1:])
