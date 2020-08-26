{ hostName, displayDpi, videoDriver }: { config, pkgs, ... }:

{
  imports = [
    (import ./dwarffs.nix)
    (import ./kernel.nix)
    (import ./keybase.nix)
    (import ./kwallet.nix)
    (import ./networking.nix { inherit hostName; })
    (import ./physlock.nix)
    (import ./printing.nix)
    (import ./software.nix)
    (import ./ssh.nix)
    (import ./xserver.nix { inherit displayDpi videoDriver; })
  ];

}
