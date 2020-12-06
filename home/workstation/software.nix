{ ghcVersion, haskellPackages, persoPkgs }: { pkgs, lib, ... }:

let
  hask = with haskellPackages; [
    pkgs.haskell.compiler.${ghcVersion}
    cabal-install
    fast-tags
    ghcid
  ];
in {
  home = {
    packages = with pkgs; [
      arandr
      audacity
      calc
      chromium
      ctags
      persoPkgs.discord
      djview
      dmenu
      evince
      libinput
      libnotify
      lightdm
      pavucontrol
      p7zip
      simplescreenrecorder
      thunderbird
      scrot
      signal-desktop
      spotify
      tor-browser-bundle-bin
      vlc
      wine-staging
      winetricks
      xclip
      xdelta
      xdotool
      xorg.xbacklight
      xorg.xkill
      xsel
    ] ++ hask;
  };

  programs = {
    firefox = {
      enable = true;
    };
  };
}
