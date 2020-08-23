{ pkgs, lib, ... }:

let
  nixpkgsStableSrc = import ../../deps/nixpkgs-stable/thunk.nix;
in {
  imports = [
    (import ./git.nix)
    (import ./nix.nix { nixpkgsSrc = nixpkgsStableSrc; })
    (import ./software.nix)
    (import ./vim.nix)
    (import ./zsh.nix)
  ];
}
