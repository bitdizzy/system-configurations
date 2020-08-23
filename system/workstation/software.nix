{ config, pkgs, ... }:

{

  programs = {
    dconf.enable = true;
    ssh.startAgent = true;
  };

}
