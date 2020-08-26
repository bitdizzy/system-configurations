{ pkgs, config, ... }:

let
  dwarffs = import (import ./deps/dwarffs/thunk.nix);
in {

  systemd.packages = [
    dwarffs.defaultPackage."${builtins.currentSystem}"
  ];

  system.fsPackages = [
    dwarffs.defaultPackage."${builtins.currentSystem}"
  ];

  systemd.units."run-dwarffs.automount".wantedBy = [
    "multi-user.target"
  ];

  environment.variables.NIX_DEBUG_INFO_DIRS = [
    "/run/dwarffs"
  ];

  systemd.tmpfiles.rules = [
    "d /var/cache/dwarffs 0755 dwarffs dwarffs 7d"
  ];

  users.users.dwarffs = {
    description = "Debug symbols file system daemon user";
    group = "dwarffs";
    isSystemUser = true;
  };

  users.groups.dwarffs = {
  };

}
