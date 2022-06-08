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

    kernelParams = [ "intel_pstate=active" ];

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = false;
    };
  };

  powerManagement.cpuFreqGovernor = lib.mkForce "performance";

}
