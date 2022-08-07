{ ... }:

{
  imports = [
    (import ./direnv)
    (import ./secrets)
    (import ./internet)
    (import ./media)
    (import ./socials)
    (import ./taskwarrior)
    (import ./wine)
  ];
}
