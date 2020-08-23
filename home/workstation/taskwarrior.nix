{ homeDirectory, taskServerHost, taskServerPort, taskCredentials }: { pkgs, lib, ... }:

{

  programs = {
    taskwarrior = {
      enable = true;
      dataLocation = "${homeDirectory}/.task";
      config = {
        nag = "";
        rc = {
          bulk = 1;
        };
        taskd = {
          server = "${taskServerHost}:${builtins.toString taskServerPort}";
          certificate = "${homeDirectory}/.task/keys/public.cert";
          key = "${homeDirectory}/.task/keys/private.key";
          ca = "${homeDirectory}/.task/keys/ca.cert";
          credentials = taskCredentials;
        };
      };
    };
  };

  services = {
    taskwarrior-sync.enable = true;
  };

}
