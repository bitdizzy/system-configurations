{ pkgs, lib, ... }:

{
  musnix.enable = true;
  users.users.min.extraGroups = [ "audio" ];

  imports = [
    (import ./musnix-src)
  ];

}
