{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pciutils
    vulkan-loader
    vulkan-tools
  ];

  programs = {
    mosh.enable = true;
  };

}
