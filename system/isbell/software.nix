{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vulkan-loader
    vulkan-tools
  ];

}
