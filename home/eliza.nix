{ ... }:

let
in rec {
  imports = [
    (import ../infra)
    (import ../sources)
    (import ./common.nix)
    (import ./workstation.nix)
  ];

  my.taffybar.source = "laptop";
}
