{ pkgs, lib, ... }:

{
  boot.kernelPackages = lib.mkForce (pkgs.linuxPackages_5_4_rt);
  musnix.kernel.packages = pkgs.linuxPackages_5_4_rt;
  musnix.enable = true;
  musnix.kernel = {
    optimize = true;
    realtime = true;
  };
  musnix.das_watchdog.enable = true;
  users.users.min.extraGroups = [ "audio" ];

  imports = [
    (import ./musnix-src)
  ];

}
