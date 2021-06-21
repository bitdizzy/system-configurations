{ homeDirectory }: { pkgs, lib, ... }:

{
  programs = {
    gpg = {
      enable = true;
    };

    password-store = {
      enable = true;
      package = pkgs.pass.withExtensions (p: with p; [ ]);
      settings = {
        PASSWORD_STORE_DIR = "${homeDirectory}/.password-store";
      };
    };
  };

  services = {
    gpg-agent = {
      enable = true;
      # Default for XFCE
      pinentryFlavor = "gtk2";
    };

    password-store-sync = {
      enable = true;
    };
  };

}
