{ config, pkgs, ... }:

{
  services.openssh = {
    forwardX11 = true;
    permitRootLogin = "no"; # nope
  };
}
