{ ... }:

{
  imports = [
    (import ./cli-utils)
    (import ./git)
    (import ./nix)
    (import ./perf-monitoring)
    (import ./search)
    (import ./ssh)
    (import ./vim)
    (import ./zsh/basic.nix)
  ];
}
