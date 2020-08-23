{ ghcVersion, haskellPackages }: { pkgs, lib, ... }:

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
      adobe-reader
      audacity
      calc
      chromium
      discord
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
      wine
      xclip
      xdelta
      xdotool
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
