{  pkgs, lib, ... }:

{
  home = {
    packages = with pkgs; [
      dolphinEmu
      dwarf-fortress
      electrum
      monero-gui
      lutris
    ];
  };

}
