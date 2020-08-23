{ nixpkgs, externalHost, taskServerPort, taskUsers, adminEmail }: { config, pkgs, ... }:

{
  imports = [
    (import ./filesystems.nix)
    (import ./hardware.nix)
    (import ./kernel.nix { inherit nixpkgs; })
    (import ./networking.nix)
    (import ./server.nix { inherit externalHost taskServerPort taskUsers adminEmail; })
    (import ./software.nix)
    (import ./users.nix)
  ];

}
