{ config, pkgs, ... }:

{
  boot.supportedFilesystems = [ "zfs" ];
  networking.hostId = "69736265";

  boot.initrd.luks.devices."nixos".device = "/dev/disk/by-uuid/c5a7b841-6614-4d25-bd4a-fd2625d5cc15";
  boot.initrd.luks.devices."nixos-mirror".device = "/dev/disk/by-uuid/a7c3d65f-1ae5-44c5-b75b-eebf489a6273";

  fileSystems."/" =
    { device = "rpool/root/nixos";
      fsType = "zfs";
    };

  fileSystems."/home" =
    { device = "rpool/home";
      fsType = "zfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/A111-0FB7";
      fsType = "vfat";
    };

  # fileSystems."/" =
  #   { device = "/dev/disk/by-uuid/a11c6658-fc6e-4561-b1a3-c850558e8b74";
  #     fsType = "ext4";
  #   };

  # boot.initrd.luks.devices."crypt".device = "/dev/disk/by-uuid/cf2d6af5-2974-4c94-a664-05f8bb5c381a";

  # fileSystems."/boot" =
  #   { device = "/dev/disk/by-uuid/CB1E-326E";
  #     fsType = "vfat";
  #   };

  swapDevices = [ ];
}
