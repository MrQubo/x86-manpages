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
    rev = "6532db03f852ae42264022c49d9a26aed3d74850";
    hash = "sha256-jZiGOHthsKAUzygIwP8hzjY7Pkt0J5f8SOQfFTfxD3E=";
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
