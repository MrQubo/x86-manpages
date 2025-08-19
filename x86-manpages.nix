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
    rev = "1dc2e43e1e4d18032ac8b61087417e2f07c97554";
    hash = "sha256-Rswm1X1H1V/snMXYmQtVObsjM7/4noNVug1hvTdAyxg=";
  };

  installPhase = ''
    mkdir -p "$out/man/man7"
    for m in man7/*; do
      install -m 644 "$m" -t "$out/man/man7"
    done
  '';

  meta = with lib; {
    description = "Manpages for x86 instructions";
    homepage = "https://github.com/ttmo-O/x86-manpages";
    platforms = platforms.all;
  };

  passthru.updateScript = unstableGitUpdater { };
}
