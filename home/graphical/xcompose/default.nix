{ config, lib, sources, ... }:

let
  pkgs = config.my.nixpkgs.default;
  xcompose-file = import "${sources.gen-xcompose}/output.nix" {
    inherit (pkgs) runCommand;
    gen-xcompose = config.my.haskell.packages.callPackage "${sources.gen-xcompose}/package.nix" {};
  };
in {
  home = {
    file = {
      xcompose = {
        source = xcompose-file;
        target = ".XCompose";
      };
    };
  };

}
