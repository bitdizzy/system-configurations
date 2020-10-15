{ pkgs, lib, ... }:

let
  my-papercolor-theme = pkgs.vimUtils.buildVimPlugin {
    pname = "papercolor-theme";
    version = "2020-08-23";
    src = import ./vim/deps/papercolor-theme/thunk.nix;
    meta.homepage = "https://github.com/bitdizzy/papercolor-theme/";
  };
in {
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
        vim-nix
        my-papercolor-theme
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
