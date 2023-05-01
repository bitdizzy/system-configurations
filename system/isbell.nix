{ basaltSrc, configurationSrc, virtUsers, privateConfig ? [] }: { config, pkgs, ... }:

let
  hostName = "isbell";
  numBuildCores = 6;
  displayDpi = 220;
  videoDriver = "intel";
  nixpkgs = import ../deps/nixpkgs-unstable/thunk.nix;
in {
  ### Sucks
  system.stateVersion = "17.03";
  ###

  imports = [
    (import ./common { inherit basaltSrc numBuildCores nixpkgs configurationSrc; })
    (import ./workstation { inherit hostName displayDpi videoDriver; })
    (import ./laptop)
    (import ./bluetooth.nix)
    (import ./isbell { inherit nixpkgs; })
    # (import ./musnix)
    (import ./virtualisation.nix { inherit virtUsers; })
  ] ++ privateConfig;

}
