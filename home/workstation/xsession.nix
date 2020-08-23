{ pkgs, lib, ... }:

{
  xsession = {
    enable = true;
    scriptPath = ".xsession-home-manager";
    initExtra = ''
      xset r rate 250 50
      nvidia-settings --assign GPULogoBrightness=0
      ${pkgs.kwallet-pam}/libexec/pam_kwallet_init
    '';
  };
}
