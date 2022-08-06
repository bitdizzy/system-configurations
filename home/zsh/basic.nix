{ ... }:

{
  home = {
    sessionVariables = {
      REPORTTIME = 1;
    };
  };

  programs = {
    zsh = {
      enable = true;
      dotDir = "zsh";
      initExtra = ''
        setopt PromptSp
      '';
      oh-my-zsh = {
        enable = true;
        plugins = [
          "taskwarrior"
        ];
      };
    };
  };

}
