{  pkgs, unstablePkgs, lib, ... }:

{
  home = {
    packages = with pkgs; [
      dolphinEmu
      dwarf-fortress
      electrum
      monero-gui
      lutris
      unstablePkgs.minecraft
    ];
  };

}
