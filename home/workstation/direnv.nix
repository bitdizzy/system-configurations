{ homeDirectory }: { pkgs, lib, ... }:

{
  home = {
    file = {
      direnv_home_manager = {
        source = ./direnv/perso.envrc;
        target = "home-manager-configuration/.envrc";
      };
      direnv_system_configuration = {
        source = ./direnv/perso.envrc;
        target = "system-configuration/.envrc";
      };
      direnv_perso = {
        source = ./direnv/perso.envrc;
        target = "perso/.envrc";
      };
      direnv_pass = {
        source = ./direnv/perso.envrc;
        target = ".password-store/.envrc";
      };
    };
  };

  programs = {
    direnv = {
      enable = true;
      config = {
        whitelist = {
          exact = [
            "${homeDirectory}/home-manager-configuration/.envrc"
            "${homeDirectory}/system-configuration/.envrc"
            "${homeDirectory}/perso/.envrc"
            "${homeDirectory}/.password-store/.envrc"
            "${homeDirectory}/work/.envrc"
          ];
        };
      };
    };
  };
}
