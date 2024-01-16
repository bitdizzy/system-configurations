{ basaltSrc, configurationSrc, virtUsers, privateConfig ? [] }: { config, pkgs, ... }:

let
  hostName = "isbell";
  numBuildCores = 6;
  displayDpi = 220;
  videoDriver = "nvidia";

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

  # Nvidia hybrid
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    powerManagement = {
      enable = true;
      finegrained = true;
    };
    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  hardware.opengl = {
    extraPackages = with pkgs; [
      # intel-media-driver # LIBVA_DRIVER_NAME=iHD
      # vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      # vaapiVdpau
      # libvdpau-va-gl
    ];
  };

  # environment.variables."LIBVA_DRIVER_NAME" = "iHD";

}
