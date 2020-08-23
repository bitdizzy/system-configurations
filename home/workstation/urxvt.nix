{ pkgs, lib, ... }:

{
  home = {
    file = {
      urxvt-font-size = {
        source = ./urxvt/urxvt-font-size/font-size;
        target = ".urxvt/ext/font-size";
      };
      urxvt-clipboard = {
        source = ./urxvt/urxvt-perls/deprecated/clipboard;
        target = ".urxvt/ext/clipboard";
      };
    };
  };

  programs = {
    urxvt = {
      enable = true;
      package = pkgs.rxvt_unicode-with-plugins;
      fonts = [
        "xft:Source Code Pro:pixelsize=28:antialias=true"
        "xft:DejaVu Sans Mono:pixelsize=28:antialias=true"
        "xft:unifont:pixelsize=28"
      ];
      iso14755 = false;
      keybindings = {
        "Shift-Control-C" = "perl:clipboard:copy";
        "Shift-Control-V" = "perl:clipboard:paste";
        "Control-equal" = "perl:font-size:increase";
        "Control-minus" = "perl:font-size:decrease";
        "Control-0" = "perl:font-size:reset";
        "Control-Up" = "\\033[1;5A";
        "Control-Down" = "\\033[1;5B";
        "Control-Right" = "\\033[1;5C";
        "Control-Left" = "\\033[1;5D";
        "Shift-Control-Up" = "\\033[1;6A";
        "Shift-Control-Down" = "\\033[1;6B";
        "Shift-Control-Right" = "\\033[1;6C";
        "Shift-Control-Left" = "\\033[1;6D";
      };
      scroll = {
        bar.enable = false;
        lines = 12000;
        keepPosition = true;
        scrollOnKeystroke = true;
        scrollOnOutput = false;
      };
      extraConfig = {
        boldFont = ''
          xft:Source Code Pro:bold:pixelsize=28:antialias=true, \
          xft:DejaVu Sans Mono:bold:pixelsize=28:antialias=true, \
          xft:unifont:pixelsize=28:bold
        '';
        "clipboard.copycmd" = "xsel -ib";
        "clipboard.pastecmd" = "xsel -ob";
        cursorBlink = "1";
        perl-ext-common = "default,clipboard,font-size";
        pointerShape = "xterm";
        pointerColor = "red";
        pointerColor2 = "red";
        urgentOnBell = true;
      };
    };
  };

}
