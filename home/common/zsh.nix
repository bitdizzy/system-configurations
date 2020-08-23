{ pkgs, lib, ... }:

{
  home = {
    sessionVariables = {
      EDITOR = "vim";
      REPORTTIME = 1;
    };
  };

  programs = {
    zsh = {
      enable = true;
      dotDir = "zsh";
      initExtra = ''
        setopt PromptSp
        export FZF_DEFAULT_COMMAND='ag -g ""'
      '';
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "taskwarrior"
        ];
      };
    };
  };

}
