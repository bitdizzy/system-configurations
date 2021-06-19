{ homeDirectory, taskServerHost, taskServerPort, taskCredentials }: { pkgs, lib, ... }:

let
  nixpkgsUnstableSrc = import ../../deps/nixpkgs-unstable/thunk.nix;
  unstablePkgs = import nixpkgsUnstableSrc {};
  ghcVersion = ""; # use default compiler which is currently "ghc8104"
  customHaskellPackages = import ./haskell.nix {
    pkgs = unstablePkgs;
    compiler = ghcVersion;
  };
in {
  imports = [
    (import ./direnv.nix { inherit homeDirectory; })
    (import ./secrets.nix { inherit homeDirectory; })
    (import ./software.nix { haskellPackages = customHaskellPackages; })
    (import ./taffybar.nix { haskellPackages = customHaskellPackages; })
    (import ./taskwarrior.nix { inherit homeDirectory taskServerHost taskServerPort taskCredentials; })
    (import ./ui.nix { haskellPackages = customHaskellPackages; })
    (import ./urxvt.nix)
    (import ./xcompose.nix { haskellPackages = customHaskellPackages; })
    (import ./xsession.nix)
    (import ./zsh.nix { inherit homeDirectory; })
  ];

}
