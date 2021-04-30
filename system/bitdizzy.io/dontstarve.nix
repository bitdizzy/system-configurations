{ clusterTokenFile, clusterPassword }: { config, pkgs, ... }:

let dst-config = pkgs.callPackage ./dontstarve { inherit clusterTokenFile clusterPassword; };
    cluster = dst-config.out;
    modconf = dst-config.modconf;
in {

  systemd.services.dst_master = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    restartIfChanged = true;
    path = with pkgs; [ steamcmd steam-run rsync ];
    preStart = ''
      set -x
      mkdir -p ./server
      steamcmd << CMD
      login anonymous
      force_install_dir /home/dst/server
      app_update 343050 validate
      quit
      CMD
      chmod -R u+w ./cluster
      rsync -a "${modconf}"/dedicated_server_mods_setup.lua /home/dst/server/mods/dedicated_server_mods_setup.lua
      rsync -a "${cluster}"/ ./cluster
      chmod -R u+w ./cluster
    '';
    script = ''
      cd ./server/bin
      steam-run ./dontstarve_dedicated_server_nullrenderer -persistent_storage_root ~ -conf_dir . -cluster cluster -shard Master
    '';
    serviceConfig = {
      User = "dst";
      WorkingDirectory = "~";
      Restart = "always";
      RestartSec = 5;
      TimeoutSec = 10000;
      KillMode = "control-group";
    };
  };

 systemd.services.dst_caves = {
    wantedBy = [ "multi-user.target" ];
    after = [ "dst_master.service" "network-online.target" ];
    restartIfChanged = true;
    path = with pkgs; [ steamcmd steam-run ];
    script = ''
      cd server/bin
      steam-run ./dontstarve_dedicated_server_nullrenderer -persistent_storage_root ~ -conf_dir . -cluster cluster -shard Caves
    '';
    serviceConfig = {
      User = "dst";
      WorkingDirectory = "~";
      Restart = "always";
      RestartSec = 5;
      KillMode = "control-group";
    };
  };

  networking.firewall.allowedUDPPorts = [ 11000 11001 ];

  users.users = {
    dst = {
      name = "dst";
      createHome = true;
      home = "/home/dst";
      group = "dst";
      shell = pkgs.bashInteractive;
    };
  };

  users.groups = {
    dst = {
      name = "dst";
    };
  };

}
