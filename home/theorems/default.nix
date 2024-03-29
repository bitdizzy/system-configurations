{ config, ... }:

let pkgs = config.my.nixpkgs.default;
in {
  home = {
    packages = with pkgs; [
      agda
      coq
    ];
  };

  programs.vim.plugins = with pkgs.vimPlugins; [
    agda-vim
    Coqtail
  ];
}
