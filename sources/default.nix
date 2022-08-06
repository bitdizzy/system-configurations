{ lib, infra, ... }:

{
  _module.args.sources = infra.mapSubdirectories infra.thunkSource ./.;
}
