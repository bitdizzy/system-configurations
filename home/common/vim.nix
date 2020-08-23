{ pkgs, lib, ... }:

{
  home = {
    file = {
      vim-working-dir = {
        recursive = true;
        source = ./vim/vim-working-dir;
        target = ".vim";
      };
    };

    sessionVariables = {
      EDITOR = "vim";
    };
  };

  programs = {
    vim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [
        #vim-indent-guides
        #lastpos.vim
        #goyo.vim
        #limelight
        #ag.vim
        #vim-fugitive
        haskell-vim
        nerdtree
        nerdtree-git-plugin
        vim-nix
        papercolor-theme
        fzf-vim
        YouCompleteMe
      ];
      settings = {
        backupdir = [ "~/.vim/.backup/" ];
        directory = [ "~/.vim/.swp/" ];
      };
      extraConfig = builtins.readFile ./vim/vimrc;
    };
  };

}
