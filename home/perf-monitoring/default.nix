{ config, lib, ... }:

let pkgs = config.my.nixpkgs.default;
in {
  home = {
    packages = with pkgs; [
    ] ++ lib.optionals pkgs.stdenv.isLinux [ iotop nethogs ];
  };

  programs = {
    htop = {
      enable = true;
    };
  };
}
