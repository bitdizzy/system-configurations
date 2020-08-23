{ openPorts }: { config, pkgs, ... }:

{
  imports = [
    (import ./fail2ban.nix)
    (import ./networking.nix { inherit openPorts; } )
  ];

}
