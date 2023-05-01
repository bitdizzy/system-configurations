# Fundamental parameters shared by all systems
{ config, pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_6_1;
    kernel.sysctl = {
      # this setting is often defaulted too low
      # which leads to hangs in OOM situations
      "vm.min_free_kbytes" = 65536;
      "kernel.unprivileged_userns_clone" = 1;
    };
  };
}
