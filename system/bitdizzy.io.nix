{ basaltSrc, configurationSrc, openPorts, externalHost, adminEmail, dontStarveSecret, privateConfig ? [] }: {config, pkgs, ... }:

let
  hostName = "bitdizzy";
  numBuildCores = 1;
  nixpkgs = import ../deps/nixpkgs-stable/thunk.nix;
in {

  ### Sucks
  system.stateVersion = "20.03";

  imports = [
    (import ./common { inherit basaltSrc numBuildCores nixpkgs configurationSrc; })
    (import ./headless { inherit hostName; })
    (import ./server { inherit openPorts; })
    (import ./bitdizzy.io { inherit nixpkgs dontStarveSecret; })
  ] ++ privateConfig;

}
