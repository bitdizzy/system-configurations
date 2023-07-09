{ config, pkgs, ... }:

{
  services.physlock = {
    enable = true;
    allowAnyUser = true;
    disableSysRq = false;
    lockOn = {
      hibernate = false;
      suspend = false;
    };
  };

}
