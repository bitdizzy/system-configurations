{ ... }:

rec {
  imports = [
    (import ../infra)
    (import ../sources)
    (import ./basic)
    (import ./workstation.nix)
    (import ./personal)
    (import ./yubikey)
  ];

  my.machine.flavor = "desktop";
}

