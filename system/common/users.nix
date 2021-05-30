{ config, pkgs, ... }:

let userKeys = import ../keys.nix;
in {

  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      root.initialHashedPassword = "$6$.Q664jtsxN$MfurQET/NOIUW2gNBAKTdLOqsNNA4fR2BidzOgYrKwMQnCccfM3dQ51ETObKjA2xFIfJBOAeh4Wyzt8X5/GcS0";
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
