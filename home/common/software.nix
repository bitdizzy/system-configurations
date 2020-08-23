{ pkgs, lib, ... }:

{
  home = {
    packages = with pkgs; [
      fzf
      iotop
      nethogs
      p7zip
      silver-searcher
    ];
  };

  programs = {
    htop = {
      enable = true;
    };

    ssh = {
      enable = true;
    };
  };
}
