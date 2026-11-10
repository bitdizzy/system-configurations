{ config, pkgs, ... }:

{

  programs = {
    dconf.enable = true;
    ssh.startAgent = true;
  };

  services.gnome.gcr-ssh-agent.enable = false;
}
