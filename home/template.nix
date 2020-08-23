{ homeDirectory, taskServerHost, taskServerPort, privateModules ? [] }: {pkgs, lib, ... }:

let nixpkgsStableSrc = import ../deps/nixpkgs-stable/thunk.nix;
    nixpkgsUnstableSrc = import ../deps/nixpkgs-unstable/thunk.nix;
    unstablePkgs = import nixpkgsUnstableSrc {};
in rec {
  imports = [
  ] ++ privateModules;

  home = {
    inherit homeDirectory;
  };

}

