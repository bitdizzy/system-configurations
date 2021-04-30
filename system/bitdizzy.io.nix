{ basaltSrc, configurationSrc, openPorts, externalHost, adminEmail, dontStarveSecret, dontStarvePassword, privateConfig ? [] }: {config, pkgs, ... }:

let
  hostName = "bitdizzy";
  numBuildCores = 1;
  nixpkgs = import ../deps/nixpkgs-unstable/thunk.nix;
in {

  ### Sucks
  system.stateVersion = "20.03";

  imports = [
    (import ./common { inherit basaltSrc numBuildCores nixpkgs configurationSrc; })
    (import ./headless { inherit hostName; })
    (import ./server { inherit openPorts; })
    (import ./bitdizzy.io { inherit nixpkgs dontStarveSecret dontStarvePassword; })
    ((import nixpkgs {}).path + /nixos/modules/virtualisation/amazon-image.nix)
  ] ++ privateConfig;

}
