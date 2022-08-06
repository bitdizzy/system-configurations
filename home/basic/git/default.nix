{ ... }:

{
  home = {
    file = {
      git_config = {
        source = ./config;
        target = ".gitconfig";
      };
    };
  };

  programs.zsh.oh-my-zsh.plugins = [
    "git"
  ];
}
