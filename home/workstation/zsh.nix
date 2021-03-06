{ homeDirectory }: { pkgs, lib, ... }:

{
  home = {
    file = {
      custom_oh-my-zsh = {
        source = ./zsh_custom;
        target = "zsh/custom";
      };
    };
  };

  programs = {
    zsh = {
      oh-my-zsh = {
        custom = "${homeDirectory}/zsh/custom";
        plugins = [
          "bgnotify"
        ];
      };

      shellAliases = {
        agh = "ag --haskell";
      };

      plugins = [
        { name = "oh-my-via";
          src = ./oh-my-via;
          file = "via.zsh-theme";
        }
      ];
    };
  };

}
