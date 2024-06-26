{ config, lib, ... }:

let pkgs = config.my.nixpkgs.default;
in {
  programs = {
    gpg = {
      enable = true;
    };

    password-store = {
      enable = true;
      package = pkgs.pass.withExtensions (p: with p; [ ]);
      settings = {
        PASSWORD_STORE_DIR = "${config.home.homeDirectory}/.password-store";
      };
    };
  };

  services = {
    gpg-agent = {
      enable = true;
      # Default for XFCE
      pinentryPackage = lib.mkIf (pkgs.stdenv.isLinux) pkgs.pinentry-qt;
    };

    # password-store-sync = {
    #   enable = true;
    # };
  };

}
