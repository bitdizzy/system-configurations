{ config, ... }:

{
  home = {
    packages = with config.my.nixpkgs.default; [
      chromium
      thunderbird
    ];
  };

  programs.firefox.enable = true;
}
