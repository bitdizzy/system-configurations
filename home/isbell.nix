{ ... }:

let
in rec {
  imports = [
    (import ../infra)
    (import ../sources)
    (import ./basic)
    (import ./workstation.nix)
    (import ./daw)
    (import ./theorems)
  ];


  my.machine.flavor = "laptop";

}
