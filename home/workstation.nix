{ ... }:

{
  imports = [
    (import ./direnv)
    (import ./secrets)
    (import ./dev)
    (import ./graphical)
    (import ./haskell)
    (import ./internet)
    (import ./media)
    (import ./socials)
    (import ./taffybar)
    (import ./taskwarrior)
    (import ./urxvt)
    (import ./wine)
    (import ./xcompose)
    (import ./xsession)
    (import ./zsh/full.nix)
  ];
}
