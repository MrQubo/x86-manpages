{
  lib,
  stdenv,
  fetchFromGitHub,
  unstableGitUpdater,
}:

stdenv.mkDerivation {
  pname = "x86-manpages";
  version = "0-unstable-2025-08-19";

  src = fetchFromGitHub {
    owner = "MrQubo";
    repo = "x86-manpages";
    rev = "df2c19971fe1c0790f8df8c55a6a26fe5715bf40";
    hash = "sha256-t8woXEcOVmvdQka5f90m4bMV7zyXMA1Fd2ywnETI1eo=";
  };

  installPhase = ''
    mkdir -p "$out/man/man7"
    for m in man7/*; do
      install -m 644 "$m" -t "$out/man/man7"
    done
  '';

  meta = with lib; {
    description = "Manpages for x86 instructions";
    homepage = "https://github.com/MrQubo/x86-manpages";
    platforms = platforms.unix;
  };

  passthru.updateScript = unstableGitUpdater { };
}
