# x86-manpages nix derivation

You can import this repo directly in your config, like this:
```nix
let
  x86-manpages = import (fetchTarball {
    url = "https://github.com/MrQubo/x86-manpages/archive/nix.tar.gz";
  }) { inherit pkgs; };
in
...
```
and then add `x86-manpages` to `environment.systemPackages`, or `home.packages` if you prefer home-manager.

Optionally you can pin version by replacing `nix.tar.gz` with a specific commit, or with channels, niv, npins, or whatever's your poison.
No flake, cause I don't use them (but PR welcome).
