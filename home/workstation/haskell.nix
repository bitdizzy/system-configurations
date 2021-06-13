{ compiler ? "", pkgs }:

with pkgs.haskell.lib;
let myPackages = (pkgs.haskell.packages.${compiler} or pkgs.haskellPackages);
in myPackages.extend (self: super: {
#pkgs.haskell.packages.${compiler}.extend (self: super: {
  taffybar = addPkgconfigDepends (self.callCabal2nix "taffybar" (import ./haskell/deps/taffybar/thunk.nix) {}) [pkgs.gtk3];
})
