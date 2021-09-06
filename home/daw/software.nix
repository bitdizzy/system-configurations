{ unstablePkgs }: { pkgs, lib, ... }:

{
  home = {
    packages = with unstablePkgs; [
      ardour
      carla
      # plugins
      surge
      zynaddsubfx
      drumgizmo
    ];
  };
}

