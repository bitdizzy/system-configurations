{ config, sources, ... }:

let pkgs = config.my.nixpkgs.default;
in {

  imports = [
    (import ./basic.nix)
  ];

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
        custom = "${config.home.homeDirectory}/zsh/custom";
        plugins = [
          "bgnotify"
        ];
      };

      shellAliases = {
        agh = "ag --haskell";
      };

      plugins = [
        { name = "oh-my-via";
          src = sources.oh-my-via;
          file = "via.zsh-theme";
        }
      ];
    };
  };

}
