{ nixpkgs, dontStarveSecret, dontStarvePassword }: { config, pkgs, ... }:

{
  imports = [
    (import ./filesystems.nix)
    (import ./kernel.nix { inherit nixpkgs; })
    (import ./networking.nix)
    (import ./dontstarve.nix { clusterTokenFile = dontStarveSecret; clusterPassword = dontStarvePassword; } )
  ];

}
