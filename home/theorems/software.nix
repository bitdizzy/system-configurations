{ unstablePkgs }: {  pkgs, lib, ... }:

{
  home = {
    packages = with pkgs; [
      unstablePkgs.coq
    ];
  };

  programs.vim.plugins = with pkgs.vimPlugins; [
    Coqtail
  ];
}
