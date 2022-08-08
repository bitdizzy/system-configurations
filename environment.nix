rec {
  infra = rec {
    inherit (thunk) mapSubdirectories thunkSource;
    thunk = import ./sources/nix-thunk {};
  };

  sources = infra.mapSubdirectories infra.thunkSource ./sources;
}
