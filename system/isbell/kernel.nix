{ nixpkgs }: { config, lib, pkgs, ... }:

{
  imports = [
    (import "${nixpkgs}/nixos/modules/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "ahci"
        "nvme"
        "rtsx_pci_sdmmc"
      ];
      kernelModules = [
        "kvm-intel"
      ];
    };

    kernelParams = [
      "intel_pstate=active"
      "nvidia_drm.fbdev=1"
      "nvidia_drm.modeset=1"
      "NVreg_EnableGpuFirmware=0"
      "zfs.zfs_arc_max=17179869184"
    ];

    extraModulePackages = [
      config.boot.kernelPackages.nvidia_x11
    ];

    blacklistedKernelModules = [
      "nouveau"
      "rivafb"
      "nvidiafb"
      "rivatv"
      "nv"
      "uvcvideo"
    ];

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = false;
    };
  };

  # powerManagement.cpuFreqGovernor = lib.mkForce "performance";

}
