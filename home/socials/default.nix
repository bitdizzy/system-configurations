{ config, ... }:

let pkgs = config.my.nixpkgs.default;
in {
  home = let
    masterPkgs = config.my.nixpkgs.master;
    headPkgs = config.my.nixpkgs.head;
  in {
    packages = with pkgs; [
      headPkgs.discord
      masterPkgs.signal-desktop
    ];
  };
}
