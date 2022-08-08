rec {
  infra = rec {
    inherit (thunk) mapSubdirectories thunkSource;
    thunk = import ./sources/nix-thunk {};
  };

  sources = infra.mapSubdirectories infra.thunkSource ./sources;

  build = rec {
    inherit (pkgs) hostPlatform;
    pkgs = import (sources.nixpkgs-unstable) {};
  };

}
