{ config, pkgs, ... }:

{
  services.xserver = {
    libinput = {
      enable = true;
      accelProfile = "adaptive";
      accelSpeed = "1";
      buttonMapping = "1 2 3";
      disableWhileTyping = true;
      tappingDragLock = false;
      additionalOptions = ''
        Option "TappingDrag" "false"
      '';
    };
  };

}
