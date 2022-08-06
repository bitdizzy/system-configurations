{ ... }:

let
in rec {
  imports = [
    (import ../infra)
    (import ../sources)
    (import ./basic)
    (import ./workstation.nix)
  ];

  my.machine.flavor = "laptop";
}
