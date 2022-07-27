{ haskellPackages, masterPkgs }: { pkgs, lib, ... }:

let
  hask = with haskellPackages; [
    ghc
    cabal-install
    fast-tags
    ghcid
    nix-thunk
  ];
in {
  home = {
    packages = with pkgs; [
      arandr
      audacity
      awscli2
      calc
      chromium
      ctags
      ddd
      masterPkgs.discord
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
      # tor-browser-bundle-bin
      vlc
      wineWowPackages.staging
      winetricks
      xclip
      xdelta
      xdotool
      xorg.xbacklight
      xorg.xkill
      xsel
      zotero
      #
      haskell-language-server
    ] ++ hask;
  };

  programs = {
    firefox = {
      enable = true;
    };
  };
}
