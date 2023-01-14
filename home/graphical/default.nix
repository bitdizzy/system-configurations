{ infra, config, lib, sources, build, ... }:

let
  pkgs = config.my.nixpkgs.default;
  # graphical environment for linux machines
  linuxModule = {
    imports = [
      (import ./xcompose)
      (import ./xserver)
      (import ./xsession)
      # (import ./taffybar)
    ];
  };
in {
  imports = [
    # my favorite terminal emulator :)
    (import ./urxvt)
   ] ++ (lib.optional (build.hostPlatform.isLinux) linuxModule);

  home.packages = with pkgs; [
  ] ++ lib.optional (pkgs.hostPlatform.isDarwin) [
    # like dunst for MacOS
    terminal-notifier
  ];

  # themeing and desktop notifications :)
  home.file.custom_oh-my-zsh = {
    source = ./zsh_custom;
    target = "${config.home.homeDirectory}/${config.programs.zsh.dotDir}/custom";
  };

  programs.zsh = {
    oh-my-zsh = {
      custom = config.home.file.custom_oh-my-zsh.target;
      plugins = [
        "bgnotify"
      ];
    };

    plugins = [
      { name = "oh-my-via";
        src = sources.oh-my-via;
        file = "via.zsh-theme";
      }
    ];
  };
}
