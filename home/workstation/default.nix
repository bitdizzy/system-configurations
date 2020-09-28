{ homeDirectory, taskServerHost, taskServerPort, taskCredentials }: { pkgs, lib, ... }:

let
  nixpkgsUnstableSrc = import ../../deps/nixpkgs-unstable/thunk.nix;
  unstablePkgs = import nixpkgsUnstableSrc {};
  ghcVersion = "ghc884";
  customHaskellPackages = import ./haskell.nix {
    pkgs = unstablePkgs;
    compiler = ghcVersion;
  };
in {
  imports = [
    (import ./direnv.nix { inherit homeDirectory; })
    (import ./secrets.nix { inherit homeDirectory; })
    (import ./software.nix { inherit ghcVersion unstablePkgs; haskellPackages = customHaskellPackages; })
    (import ./taffybar.nix { haskellPackages = customHaskellPackages; })
    (import ./taskwarrior.nix { inherit homeDirectory taskServerHost taskServerPort taskCredentials; })
    (import ./ui.nix { haskellPackages = customHaskellPackages; })
    (import ./urxvt.nix)
    (import ./xsession.nix)
    (import ./zsh.nix { inherit homeDirectory; })
  ];

}
