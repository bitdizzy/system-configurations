{ config, ... }:

{
  xsession = {
    enable = true;
    scriptPath = ".xsession-home-manager";
    initExtra = ''
      $HOME/.fehbg

      nvidia-settings --assign GPULogoBrightness=0
    '';
  };

  # expose just the window manager part of the xsession
  # for integration with a desktop environment
  home.file.".xsession-home-manager-wm".text = ''

    ${config.xsession.initExtra}

    ${config.xsession.windowManager.command}

  '';
}
