rec {
  infra = {
    inherit (thunk) mapSubdirectories thunkSource;
    thunk = import ./nix-thunk {};
  };

  sources = mapSubdirectories thunkSource ./sources;
}
