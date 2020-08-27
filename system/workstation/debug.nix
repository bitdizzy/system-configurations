{ pkgs, config, ... }:

{
  imports = [
    (import ./debug/dwarffs.nix)
  ];

  nixpkgs.overlays = [
    (import ./debug/overlay.nix)
  ];

}
