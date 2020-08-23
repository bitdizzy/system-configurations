{ config, pkgs, ... }:

{
  networking = {
    firewall = {
      allowPing = true;
    };
  };
}
