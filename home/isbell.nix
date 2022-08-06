{ ... }:

let
in rec {
  imports = [
    (import ../infra)
    (import ../sources)
    (import ./common.nix)
    (import ./workstation.nix)
    (import ./acpi)
    (import ./daw)
    (import ./theorems)
  ];

  my.taffybar.source = "laptop";

}
