{ basaltSrc, configurationSrc, openPorts, externalHost, taskServerPort, adminEmail, taskUsers, virtUsers, privateConfig ? [] }: { config, pkgs, ... }:

let hostName = "lucy";
    numBuildCores = 6;
    displayDpi = 220;
    videoDriver = "nvidia";
    nixpkgs = import ../deps/nixpkgs-unstable/thunk.nix;
in {
  ### Sucks
  system.stateVersion = "18.03";

  imports = [
    (import ./common { inherit basaltSrc numBuildCores nixpkgs configurationSrc; })
    (import ./workstation { inherit hostName displayDpi videoDriver; })
    (import ./server { inherit openPorts; })
    (import ./lucy { inherit nixpkgs externalHost taskServerPort adminEmail taskUsers; })
    (import ./virtualisation.nix { inherit virtUsers; })
  ] ++ privateConfig;

}
