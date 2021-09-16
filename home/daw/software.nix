{ unstablePkgs }: { pkgs, lib, ... }:

{
  home = {
    packages = with unstablePkgs; [
      ardour
      carla
      muse
      # plugins
      surge
      zynaddsubfx
      drumgizmo
    ];
  };
}

