{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pciutils
  ];

  programs = {
    mosh.enable = true;
  };

}
