{ unstablePkgs }: { pkgs, lib, ... }:

{
  home = {
    packages = with pkgs; [
      ardour
      cadence
      # plugins
      surge
      zynaddsubfx
    ];
  };
}

