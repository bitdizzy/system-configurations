{ unstablePkgs }: { pkgs, lib, ... }:

{
  home = {
    packages = with unstablePkgs; [
      ardour
      carla
      muse
      musescore
      # plugins
      surge
      zynaddsubfx
      drumgizmo
    ];
  };
}

