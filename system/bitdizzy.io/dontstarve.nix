{ clusterTokenFile }: { config, pkgs, ... }:

let config = ./dontstarve;
in {

  systemd.services.dst_master = {
    wantedBy = [ "multi-user.target" "dst_caves.target" ];
    after = [ "network-online.target" ];
    restartIfChanged = true;
    path = with pkgs; [ steamcmd ];
    script = ''
      mkdir -p ./server
      steamcmd << CMD
      login anonymous
      force_install_dir ./server
      app_update 343050 validate
      quit
      CMD
      cp -rfp '${config}' ./config
      ln -sf '${clusterTokenFile}' ./config/cluster_token
      cd server/bin
      steam-run ./dontstarve_dedicated_server_nullrenderer -persistent_storage_root ~/dst_test -conf_dir . -cluster config -shard Master
    '';
    serviceConfig = {
      User = "dst";
      KillMode = "process";
      WorkingDirectory = "~";
      Restart = "always";
      RestartSec = 5;
    };
  };

 systemd.services.dst_caves = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    restartIfChanged = true;
    path = with pkgs; [ steamcmd ];
    script = ''
      cd server/bin
      steam-run ./dontstarve_dedicated_server_nullrenderer -persistent_storage_root ~/dst_test -conf_dir . -cluster config -shard Caves
    '';
    serviceConfig = {
      User = "dst";
      KillMode = "process";
      WorkingDirectory = "~";
      Restart = "always";
      RestartSec = 5;
    };
  };

  networking.firewall.allowedUDPPorts = [ 11000 11001 ];

  users.users = {
    dst = {
      name = "dst";
      createHome = true;
      home = "/home/dst";
      useDefaultShell = true;
      group = "dst";
    };
  };

  users.groups = {
    dst = {
      name = "dst";
    };
  };

}
