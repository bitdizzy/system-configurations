{ pkgs, lib, ... }:

{
  boot.kernelPackages = lib.mkForce (pkgs.linuxPackages_5_9_rt);
  musnix.kernel.packages = pkgs.linuxPackages_5_9_rt;
  musnix.das_watchdog.enable = true;
  musnix.kernel = {
    optimize = true;
    realtime = true;
  };
  musnix.enable = true;
  users.users.min.extraGroups = [ "audio" ];

  imports = [
    (import ./musnix-src)
  ];

}
