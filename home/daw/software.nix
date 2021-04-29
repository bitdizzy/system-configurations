{ unstablePkgs }: { pkgs, lib, ... }:

{
  home = {
    packages = with pkgs; [
      ardour
      carla
      # plugins
      surge
      zynaddsubfx
    ];
  };
}

