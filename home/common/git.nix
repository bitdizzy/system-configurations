{ pkgs, lib, ... }:

{
  home = {
    file = {
      git_config = {
        source = ./git/config;
        target = ".gitconfig";
      };
    };
  };

}
