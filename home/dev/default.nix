{ config, ... }:

let pkgs = config.my.nixpkgs.default;
in {
  home = {
    packages = with pkgs; [
      awscli2
      ctags
      ddd
      xdelta
    ];
  };
}
