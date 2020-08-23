{ config, pkgs, lib, ... }:

{
  services.acpid.enable = true;

  services.logind = {
    lidSwitch = "ignore";
    extraConfig = ''
      HandlePowerKey=ignore
    '';
  };

  services.upower.enable = true;

}
