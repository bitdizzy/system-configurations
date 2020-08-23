# Fundamental parameters shared by all systems
{ config, pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_5_4;
    kernel.sysctl = {
      # this setting is often defaulted too low
      # which leads to hangs in OOM situations
      "vm.min_free_kbytes" = 65536;
    };
  };
}
