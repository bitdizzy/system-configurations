{ ... }:

rec {
  imports = [
    (import ../infra)
    (import ../sources)
    (import ./common.nix)
    (import ./workstation.nix)
    (import ./personal)
    (import ./yubikey)
  ];

  my.taffybar.source = "desktop";
}

