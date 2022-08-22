{ config, ... }:

let
  pkgs = config.my.nixpkgs.default;
  # development tooling for haskell
  haskellModule = {
    imports = [
      (import ../haskell)
    ];

    my.haskell.compiler = "ghc902";

    home.packages = with config.my.haskell.packages; [
      ghc
      cabal-install
      ghcid
      fast-tags
      haskell-language-server
    ];

    programs.zsh.shellAliases = {
      agh = "ag --haskell";
    };
  };
in {
  imports = [
    haskellModule
  ];

  # misc programming tools
  home = {
    packages = with pkgs; [
      awscli2
      ctags
      ddd
      git-crypt
      xdelta
    ];
  };
}
