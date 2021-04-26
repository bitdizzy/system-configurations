{ pkgs, lib, ... }:

let
  nixpkgsStableSrc = import ../../deps/nixpkgs-stable/thunk.nix;
  nixpkgsUnstableSrc = import ../../deps/nixpkgs-unstable/thunk.nix;
in {
  imports = [
    (import ./git.nix)
    (import ./nix.nix { nixpkgsSrc = nixpkgsUnstableSrc; })
    (import ./software.nix)
    (import ./vim.nix)
    (import ./zsh.nix)
  ];
}
