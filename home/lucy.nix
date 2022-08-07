{ ... }:

{
  imports = [
    (import ../infra)
    (import ../sources)
    (import ./basic)
    (import ./haskell)
    (import ./graphical)
    (import ./workstation.nix)
    (import ./personal)
    (import ./yubikey)
  ];

  my.machine.flavor = "desktop";
}

