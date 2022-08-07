{ ... }:

let
in rec {
  imports = [
    (import ../infra)
    (import ../sources)
    (import ./basic)
  ];

  my.machine.flavor = "laptop";
}
