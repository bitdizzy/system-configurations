{ ... }:

{
  imports = [
    (import ../infra)
    (import ../sources)
    (import ./basic)
    (import ./dev)
    (import ./graphical)
    (import ./workstation.nix)
    (import ./personal)
    (import ./yubikey)
  ];

  my.machine.flavor = "desktop";

  home.username = "min";
  home.stateVersion = "22.11";
}

