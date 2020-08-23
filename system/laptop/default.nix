{ config, pkgs, ... }:

{
  imports = [
    (import ./power-management.nix)
    (import ./touchpad.nix)
  ];

}
