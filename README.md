# x86-manpages

This is a man page documentation for x86-64 ISA. Instructions are available with e.g:

```
man x86-jmp
man x86-call
```

<p align="center">
  <img src="ss.png" align="middle">
</p>


See `x86-manpages(7)` for a list of instructions.

## Installation

### Manually
```
$ git clone https://github.com/MrQubo/x86-manpages && cd x86-manpages
# mkdir /usr/local/man/man7
# cp man7/* /usr/local/man/man7/
```
or add "x86-manpages" root directory to your `MANPATH` environment variable.

### Using NIX

Nix derivation is available via [https://github.com/MrQubo/x86-manpages/tree/nix](https://github.com/MrQubo/x86-manpages/tree/nix).

## Methodology

Man pages are generated from Intel's official documentation like:

PDF --> html --> markdown --> man page

Conversion to html of Intel's PDF documentation is made by [Félix Cloutier](https://www.felixcloutier.com/x86/index.html); which was most of the work.

Other steps are performed in this project; with help of various tools. See "scripts" directory.


## Contribution

Maintainer gave up fixing bug-producing scripts, after he found out most of them could be ignored and perfection was not the goal. If you cannot ignore an imperfection you saw, please consider adding necessary fix to the bash scripts by a PR.

### Bugs

Since scriptized, unhandled exceptions exist. Most of them related to tables; especially `rowspan`s. Nowadays, `rowspan-normalizer` script is missing th and tr rowspan normalizer functions. And also `[` and `]` and some other characters break tables; probably they must be escaped while the doc was still in the html form.

## License

See LICENSE file, which is for the scripts used to generate the man pages.
