{ basaltSrc, openPorts, externalHost, taskServerPort, adminEmail, taskUsers, privateConfig ? [] }: { config, pkgs, ... }:

let hostName = "lucy";
    numBuildCores = 6;
    displayDpi = 220;
    videoDriver = "nvidia";
    nixpkgs = import ../deps/nixpkgs-stable/thunk.nix;
    configurationSrc = ./lucy.nix;
in {
  ### Sucks
  system.stateVersion = "18.03";

  imports = [
    (import ./common { inherit basaltSrc numBuildCores nixpkgs configurationSrc; })
    (import ./workstation { inherit hostName displayDpi videoDriver; })
    (import ./server { inherit openPorts; })
    (import ./lucy { inherit nixpkgs externalHost taskServerPort adminEmail taskUsers; })
  ] ++ privateConfig;

}
