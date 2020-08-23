{ displayDpi, videoDriver }: { config, pkgs, ...}:

{
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
    package = pkgs.pulseaudioFull;
    zeroconf.discovery.enable = true;
    daemon.config = {
      flat-volumes = "no";
    };
  };

  hardware.opengl = {
    driSupport32Bit = true;
    driSupport = true;
  };

  fonts = {
    fontconfig.enable = true;
    enableFontDir = true;
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
    ];
  };

  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "dvorak";
    xkbOptions = "caps:escape";

    autoRepeatDelay = 250;
    autoRepeatInterval = 55;

    videoDrivers = [ videoDriver ];

    displayManager.lightdm = {
      enable = true;
    };

    desktopManager = {
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

    dpi = displayDpi;

  };

  # get gnome stuff to work in home manager
  services.dbus.packages = with pkgs; [ gnome3.dconf ];

}
