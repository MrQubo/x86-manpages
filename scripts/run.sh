#!/usr/bin/env nix-shell
#!nix-shell -p rubyPackages.htmlbeautifier -p html-minifier -p go-md2man -p pandoc -p wget
#!nix-shell -i bash

#./download.sh
for f in www.felixcloutier.com/x86/*.html; do
	./doit.sh "$f"
done
