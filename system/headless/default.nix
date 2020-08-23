{ hostName }: { config, pkgs, ... }:

{
  imports = [
    (import ./networking.nix { inherit hostName; })
    (import ./ssh.nix)
  ];

}
