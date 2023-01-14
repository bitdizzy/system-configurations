{  config, ... }:

let pkgs = config.my.nixpkgs.default;
in {
  home = {
    packages = with pkgs; [
      dolphinEmu
      dwarf-fortress
      electrum
      monero-gui
      # lutris
      minecraft
      deluge
      syncplay
    ];
  };

}
