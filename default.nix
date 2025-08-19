{
  pkgs ? import <nixpkgs>,
  ...
}@args:

pkgs.callPackage ./x86-manpages.nix (builtins.removeAttrs args [ "pkgs" ])
