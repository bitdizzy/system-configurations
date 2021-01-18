{ config, pkgs, ... }:

{
  boot.supportedFilesystems = [ "zfs" ];
  networking.hostId = "69736265";

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/a11c6658-fc6e-4561-b1a3-c850558e8b74";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."crypt".device = "/dev/disk/by-uuid/cf2d6af5-2974-4c94-a664-05f8bb5c381a";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/CB1E-326E";
      fsType = "vfat";
    };

  swapDevices = [ ];
}
