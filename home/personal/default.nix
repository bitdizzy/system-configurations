{  config, ... }:

let pkgs = config.my.nixpkgs.default;
in {
  home = {
    packages = with pkgs; [
      dolphin-emu
      dwarf-fortress
      # electrum
      monero-gui
      # lutris
      # minecraft
      deluge
      syncplay
    ];
  };

}
