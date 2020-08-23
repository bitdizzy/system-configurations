{ config, pkgs, ... }:

{
  users.users = {
    fei = {
      createHome = true;
      home = "/home/fei";
      extraGroups = [ "networkmanager" "wheel" ];
      isNormalUser = true;
      useDefaultShell = true;
    };
  };
}


