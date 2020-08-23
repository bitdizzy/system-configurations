{ config, pkgs, ... }:

{
  fileSystems."/" = { device = "/dev/vda1"; fsType = "ext4"; };
}
