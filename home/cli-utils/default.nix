{ config, ... }:

let pkgs = config.my.nixpkgs.default;
in {
  home = {
    packages = with pkgs; [
      calc
      p7zip
    ];
  };
}
