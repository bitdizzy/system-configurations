{ config, pkgs, ... }:

let userKeys = import ../keys.nix;
in {
  security.initialRootPassword = "!";

  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      min = {
        name = "min";
        extraGroups = [ "wheel" "networkmanager" "fuse" ];
        createHome = true;
        home = "/home/min";
        useDefaultShell = true;
        isNormalUser = true;
        openssh.authorizedKeys.keys = userKeys.min;
      };
    };
  };

}
