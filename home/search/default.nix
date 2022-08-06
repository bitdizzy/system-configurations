{ config, ... }:

let pkgs = config.my.nixpkgs.default;
in {
  home = {
    packages = with pkgs; [
      fzf
      silver-searcher
    ];
  };

  programs.zsh.initExtra = ''
    export FZF_DEFAULT_COMMAND='ag -i -g ""'
  '';
}
