{ displayDpi, videoDriver }: { config, pkgs, ...}:

{

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  hardware.opengl = {
    driSupport32Bit = true;
    driSupport = true;
  };

  fonts = {
    fontconfig.enable = true;
    fontDir.enable = true;
    fonts = with pkgs; [
      corefonts  # Micrsoft free fonts
      inconsolata  # monospaced
      ubuntu_font_family  # Ubuntu fonts
      ttf_bitstream_vera
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      xlibs.fontbitstream100dpi
      xlibs.fontbitstream75dpi
      xlibs.fontbitstreamtype1
      vistafonts
      unifont
      terminus_font
      freefont_ttf
      liberation_ttf
      proggyfonts
      cantarell_fonts
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
      defaultSession = "xfce";
      lightdm.enable = true;
    };

    desktopManager = {
      xfce = {
        enable = true;
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
  services.dbus.packages = with pkgs; [ gnome3.dconf ];

}
