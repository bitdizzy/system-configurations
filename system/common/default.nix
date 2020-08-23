{ basaltSrc, numBuildCores, nixpkgs, configurationSrc }: { config, pkgs, ... }:

{
  imports = [
    (import ./kernel.nix)
    (import ./locale.nix)
    (import ./nix.nix { inherit numBuildCores nixpkgs configurationSrc; })
    (import ./software.nix { inherit basaltSrc; })
    (import ./ssh.nix)
    (import ./users.nix)
  ];

}
