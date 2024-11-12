{ config, ... }:

let pkgs = config.my.nixpkgs.default;
in {
  home = {
    packages = with pkgs; [
      ardour
      carla
      muse
      musescore
      # plugins
      # distrho
      surge
      zynaddsubfx
      drumgizmo
    ];
  };
}

