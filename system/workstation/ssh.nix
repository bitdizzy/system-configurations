{ config, pkgs, ... }:

{
  services.openssh.settings = {
    X11Forwarding = true;
    PermitRootLogin = "no"; # nope
  };
}
