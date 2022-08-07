{ ... }:

{
  imports = [
    (import ../infra)
    (import ../sources)
    (import ./basic)
    (import ./haskell)
    (import ./graphical)
    (import ./workstation.nix)
    (import ./daw)
    (import ./theorems)
  ];

  my.machine.flavor = "laptop";
}
