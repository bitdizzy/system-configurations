{ unstablePkgs }: {  pkgs, lib, ... }:

{
  home = {
    packages = with pkgs; [
      unstablePkgs.coq
      unstablePkgs.agda
    ];
  };

  programs.vim.plugins = with pkgs.vimPlugins; [
    Coqtail
    agda-vim
  ];
}
