{ pkgs, lib, ... }:

let
  # Forked to change highlighting of 'where' in Haskell
  my-papercolor-theme = pkgs.vimUtils.buildVimPlugin {
    pname = "papercolor-theme";
    version = "personal";
    src = import ./vim/deps/papercolor-theme/thunk.nix;
    meta.homepage = "https://github.com/bitdizzy/papercolor-theme/";
  };
  # Forked to remove '.' from cabal keywords
  my-haskell-vim = pkgs.vimUtils.buildVimPlugin {
    pname = "haskell-vim";
    version = "personal";
    src = import ./vim/deps/haskell-vim/thunk.nix;
    meta.homepage = "https://github.com/bitdizzy/haskell-vim/";
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
        #ag.vim
        #vim-fugitive
        vim-pencil
        goyo-vim
        limelight-vim
        my-haskell-vim
        nerdtree
        vim-nix
        my-papercolor-theme
        fzf-vim
        YouCompleteMe
        vim-matchup
      ];
      settings = {
        backupdir = [ "~/.vim/.backup/" ];
        directory = [ "~/.vim/.swp/" ];
      };
      extraConfig = builtins.readFile ./vim/vimrc;
    };
  };

}
