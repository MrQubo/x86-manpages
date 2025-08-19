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
    rev = "b7268dbb901c78ed4da1b773821f026ef6717ae6";
    hash = "sha256-DoLfQ1cEi2OS8GMj8Z00y7d3oLlJV4izBsmYcCSgm+Q=";
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
