{ config, ... }:

let pkgs = config.my.nixpkgs.default;
in {
  home = {
    file = {
      direnv_home_manager = {
        source = ./perso.envrc;
        target = "home-manager-configuration/.envrc";
      };
      direnv_system_configuration = {
        source = ./perso.envrc;
        target = "system-configuration/.envrc";
      };
      direnv_perso = {
        source = ./perso.envrc;
        target = "perso/.envrc";
      };
      direnv_pass = {
        source = ./perso.envrc;
        target = ".password-store/.envrc";
      };
    };
  };

  programs = {
    direnv = {
      enable = true;
      config = {
        whitelist = {
          exact =
            let homeDir = config.home.homeDirectory;
             in [ "${homeDir}/home-manager-configuration/.envrc"
                  "${homeDir}/system-configuration/.envrc"
                  "${homeDir}/perso/.envrc"
                  "${homeDir}/.password-store/.envrc"
                  "${homeDir}/work/.envrc"
                ];
        };
      };
    };
  };
}
