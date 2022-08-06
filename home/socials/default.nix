{ config, ... }:

let pkgs = config.my.nixpkgs.default;
in {
  home = let
    masterPkgs = config.my.nixpkgs.master;
  in {
    packages = with pkgs; [
      masterPkgs.discord
      masterPkgs.signal-desktop
    ];
  };
}
