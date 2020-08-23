{ config, pkgs, ... }:

{
  boot = {
    kernelModules = [
      "module-bluetooth-discover"
    ];

  };

  hardware.bluetooth.enable = true;
}
