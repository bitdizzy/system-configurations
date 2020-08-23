{ config, pkgs, ... }:

{
  fileSystems."/" =
    { device = "rpool/root/nixos";
      fsType = "zfs";
    };

  fileSystems."/home" =
    { device = "rpool/home";
      fsType = "zfs";
    };

  boot = {
    initrd.luks.devices = {
      sys_luks = {
        device = "/dev/disk/by-uuid/46fa26ef-2fdd-4869-ac8d-9eefbb4043bd";
      };
    };
  };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/68AD-E023";
      fsType = "vfat";
    };

  swapDevices = [ ];

}
