{ compiler ? "", pkgs }:

with pkgs.haskell.lib;
let myPackages = (pkgs.haskell.packages.${compiler} or pkgs.haskellPackages);
in myPackages.extend (self: super: {
  taffybar = addPkgconfigDepends (self.callCabal2nix "taffybar" (import ./haskell/deps/taffybar/thunk.nix) {}) [pkgs.gtk3];
  gen-xcompose = self.callPackage "${import ./haskell/deps/gen-xcompose/thunk.nix}/package.nix" {};
  # I don't know why taffybar insists on depending on this package in its core library
  # but I suppose I shouldn't complain that a one-person development team treats
  # the project like a personal playground.
  coinbase-pro = self.callHackageDirect {
      pkg = "coinbase-pro";
      ver = "0.9.2.2";
      sha256 = "sha256-ZFEcq9aO+72JSVBg0xWi188mz5WK1NTgs6ZGYHtO0OE=";
  } { };
})
