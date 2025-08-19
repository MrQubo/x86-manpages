#!/usr/bin/env nix-shell
#!nix-shell -p bashNonInteractive -p nix-update
#!nix-shell -i bash

exec nix-update -f update.nix --version=branch x86-manpages
