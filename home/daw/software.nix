{ unstablePkgs }: { pkgs, lib, ... }:

{
  home = {
    packages = with pkgs; [
      ardour
      # plugins
      surge
      zynaddsubfx
    ];
  };
}

