{ config, pkgs, lib, ... }:

{
  services.acpid.enable = true;

  services.logind = {
    lidSwitch = "ignore";
    settings.Login = {
      HandlePowerKey = "ignore";
    };
  };

  services.upower.enable = true;

}
