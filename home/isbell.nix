{ ... }:

{
  imports = [
    (import ./basic)
    (import ./dev)
    (import ./graphical)
    (import ./workstation.nix)
    (import ./daw)
    (import ./theorems)
    (import ./personal)
  ];

  my.machine.flavor = "laptop";

  home.username = "min";
  home.stateVersion = "22.11";
}
