{ displayDpi, videoDriver }: { config, pkgs, ...}:

{

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    jack.enable = true;
    extraConfig.pipewire = {
      "99-disable-bell" = {
        "context.properties" = {
            "module.x11.bell" = false;
        };
      };
    };
  };

  fonts = {
    fontconfig.enable = true;
    fontDir.enable = true;
    packages = with pkgs; [
      corefonts  # Micrsoft free fonts
      inconsolata  # monospaced
      ubuntu_font_family  # Ubuntu fonts
      ttf_bitstream_vera
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      xorg.fontbitstream100dpi
      xorg.fontbitstream75dpi
      xorg.fontbitstreamtype1
      vistafonts
      unifont
      terminus_font
      freefont_ttf
      liberation_ttf
      proggyfonts
      cantarell-fonts
      dejavu_fonts
      dina-font
      dosemu_fonts
      source-code-pro
      julia-mono
    ];
  };

  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "dvorak";
    xkbOptions = "caps:escape,compose:ralt";

    autoRepeatDelay = 250;
    autoRepeatInterval = 55;

    videoDrivers = [ videoDriver ];

    displayManager = {
      defaultSession = "xfce+wm-home-manager";
      lightdm.enable = true;
    };

    desktopManager = {
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
      # Custom session for home-manager xsession, because
      # (at least at the time) NixOS unconditionally defaults
      # to .xsession if it is present.
      #
      # This lets the home-manager xsession coexist with others
      session = [
        {
          name = "home-manager";
          start = ''
            ${pkgs.runtimeShell} $HOME/.xsession-home-manager &
            waitPID=$!
          '';
        }
      ];
    };

    windowManager = {
      session = [
        {
          name = "wm-home-manager";
          start = ''
            ${pkgs.runtimeShell} $HOME/.xsession-home-manager-wm &
          '';
        }
      ];
    };

    dpi = displayDpi;

  };

  # get gnome stuff to work in home manager
  services.dbus.packages = with pkgs; [ dconf ];

}
