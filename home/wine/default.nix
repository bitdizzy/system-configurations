{ config, ... }:

{
  home = {
    packages = with config.my.nixpkgs.default; [
      wineWowPackages.staging
      winetricks
    ];
  };
}
