{
  pkgs ? import <nixpkgs> { },
}:

{
  x86-manpages = import ./default.nix { inherit pkgs; };
}
