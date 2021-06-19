{ config, pkgs, lib, ... }:

{
  xsession = {
    enable = true;
    scriptPath = ".xsession-home-manager";
    initExtra = ''
      $HOME/.fehbg
      xset r rate 250 50
      nvidia-settings --assign GPULogoBrightness=0
      ${pkgs.kwallet-pam}/libexec/pam_kwallet_init
    '';
  };

  # expose just the window manager part of the xsession
  # for integration with a desktop environment
  home.file.".xsession-home-manager-wm".text = ''

    ${config.xsession.initExtra}

    ${config.xsession.windowManager.command}

  '';
}
