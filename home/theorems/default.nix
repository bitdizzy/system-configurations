{ pkgs, lib, ... }:

let
  nixpkgsUnstableSrc = import ../../deps/nixpkgs-unstable/thunk.nix;
  unstablePkgs = import nixpkgsUnstableSrc {};
in {
  imports = [
    (import ./software.nix { inherit unstablePkgs; })
  ];

}
