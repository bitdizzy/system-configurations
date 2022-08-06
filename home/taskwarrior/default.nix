{ config, lib, ... }:

let pkgs = config.my.nixpkgs.default;
in {
  options = {
    my.taskwarrior = with lib; {
      host = mkOption {
        type = types.str;
      };
      port = mkOption {
        type = types.int;
      };
      credentials = mkOption {
        type = types.str;
      };
    };
  };

  config = {
    programs =
      let homeDirectory = config.home.homeDirectory;
      in {
        zsh.oh-my-zsh.plugins = [
          "taskwarrior"
        ];
        taskwarrior = {
          enable = true;
          dataLocation = "${homeDirectory}/.task";
          config = {
            nag = "";
            rc = {
              bulk = 1;
            };
            taskd = {
              server = "${config.my.taskwarrior.host}:${builtins.toString config.my.taskwarrior.port}";
              certificate = "${homeDirectory}/.task/keys/public.cert";
              key = "${homeDirectory}/.task/keys/private.key";
              ca = "${homeDirectory}/.task/keys/ca.cert";
              credentials = config.my.taskwarrior.credentials;
            };
          };
        };
    };

    services = {
      taskwarrior-sync.enable = true;
    };
  };

}
