{ config, ... }:

{
  home = {
    packages = with config.my.nixpkgs.default; [
      audacity
      djview
      spotify
      vlc
      zotero
    ];
  };

  programs = {
    firefox = {
      enable = true;
    };
  };
}
