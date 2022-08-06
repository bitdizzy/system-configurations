{ lib, ... }:

{
  options = {
  };

  config = {
    _module.args.infra = rec {
      inherit (thunk) mapSubdirectories thunkSource;
      thunk = import ./nix-thunk {};
    };
  };
}
