{ config, pkgs, ... }:

{

  services.postgresql = {
    enable = true;
    enableTCPIP = true;
    dataDir = "/var/db/postgresql";
    package = pkgs.postgresql_11;
    port = 5432;
    extraConfig =
       '' max_pred_locks_per_transaction = 8192
          max_wal_senders = 2
          wal_level = hot_standby
          wal_keep_segments = 8
       '';
    authentication = pkgs.lib.mkForce
    '' local all all ident
       host all all 127.0.0.1/32 md5
       host all all ::1/128 md5
    '';
  };

}
