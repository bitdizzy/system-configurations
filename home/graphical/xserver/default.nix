{ config, lib, sources, ... }:

let pkgs = config.my.nixpkgs.default;
in {
  home = {
    keyboard = null;
    packages = with pkgs; [
      gtk3
      adwaita-icon-theme
      numix-gtk-theme
      numix-icon-theme
      hicolor-icon-theme

      libinput
      libnotify
      lightdm

      arandr
      dmenu
      evince
      pavucontrol
      scrot
      simplescreenrecorder
      xclip
      xdotool
      xorg.xbacklight
      xorg.xkill
      xsel

    ];
    pointerCursor = {
      package = pkgs.vanilla-dmz;
      name = "Vanilla-DMZ";
      x11.defaultCursor = "left_ptr";
      x11.enable = true;
    };

  };
  gtk = {
    enable = true;
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    theme = {
      name = "Numix";
      package = pkgs.numix-gtk-theme;
    };
    gtk2.extraConfig = ''
      gtk-error-bell=0
      gtk-enable-event-sounds=0
    '';
    gtk3.extraConfig = {
      gtk-error-bell = 0;
      gtk-enable-event-sounds = 0;
    };
    gtk4.extraConfig = {
      gtk-error-bell = 0;
      gtk-enable-event-sounds = 0;
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
  };

  dconf.settings = {
    "org.gtk.Settings.Debug" = {
      enable-inspector-keybinding = true;
    };
  };

  services = {
    dunst = {
      enable = true;
      settings = {
        global = {
          font = "Source Code Pro 12";
          markup = "yes";
          format = "<b>%s</b>\n%b";
          sort = "yes";
          indicate_hidden = "yes";
          alignment = "left";
          bounce_freq = 0;
          show_age_threshold = 60;
          word_wrap = "yes";
          ignore_newline = "no";
          geometry = "300x5-30+20";
          shrink = "no";
          idle_threshold = 120;
          monitor = 0;
          follow = "mouse";
          sticky_history = "no";
          history_length = 20;
          show_indicators = "yes";
          line_height = 0;
          separator_height = 2;
          padding = 8;
          horizontal_padding = 8;
          separator_color = "frame";
          startup_notification = false;
          dmenu = "~/.nix-profile/bin/dmenu -p dunst:";
          browser = "~/.nix-profile/bin/firefox -new-tab";
          icon_position = "off";
          frame_width = 4;
          frame_color = "#aaaaaa";
        };
        urgency_low = {
          background = "#222222";
          foreground = "#888888";
          timeout = 10;
        };
        urgency_normal = {
          background = "#285577";
          foreground = "#ffffff";
          timeout = 10;
        };
        urgency_critical = {
          background = "#900000";
          foreground = "#ffffff";
          timeout = 0;
        };
      };
    };

    clipmenu.enable = true;

    network-manager-applet.enable = true;
    redshift = {
      enable = true;
      latitude = "40.720580";
      longitude = "-73.984932";
    };
  };

  xresources = {
    properties = {
      "*.dpi" = "220";
      "Xft.hinting" = true;
      "Xft.hintstyle" = "hintfull";
      "dmenu.font" = "monospace-8";
    };
    extraConfig = lib.concatStringsSep "\n" [
      (builtins.readFile "${sources.urxvt}/iTerm2-Color-Schemes/Xresources/Pandora")
    ];
  };

  xsession = {
    windowManager.xmonad = {
      # TODO this doesn't work
      #haskellPackages = with config.my.haskell.lib; config.my.haskell.packages.extend (self: super: {
      #      taffybar = doJailbreak (addPkgconfigDepends (self.callCabal2nix "taffybar" sources.taffybar {}) [pkgs.gtk3]);
      #    });
      # even this, which should be a no-op, doesn't work??
      # haskellPackages = pkgs.haskellPackages;
      enable = true;
      config = ./xmonad/xmonad.hs;
      enableContribAndExtras = true;
      extraPackages = p: with p; [
        ghc
        data-default
        lens
        # taffybar
      ];
    };
  };

}
