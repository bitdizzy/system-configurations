{ nixpkgs }: { config, lib, pkgs, ... }:

{
  imports = [
    (import "${nixpkgs}/nixos/modules/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd.availableKernelModules = [
      "xhci_pci"
      "ahci"
      "usbhid"
      "usb_storage"
      "sd_mod"
    ];

    kernelModules = [
      "kvm-intel"
    ];

    kernel.sysctl = {
      "net.core.default_qdisc" = "sch_fq";
    };

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = false;
    };

    supportedFilesystems = [ "zfs" ];

    zfs = {
      forceImportAll = true;
      forceImportRoot = true;
    };
  };

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

}
