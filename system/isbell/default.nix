{ nixpkgs }: { config, pkgs, ... }:

{
  imports = [
    (import ./filesystems.nix)
    (import ./kernel.nix { inherit nixpkgs; })
  ];

}
