{ haskellPackages }:

haskellPackages.callPackage (haskellPackages.callCabal2nix "my-taffybar" ./.) {}
