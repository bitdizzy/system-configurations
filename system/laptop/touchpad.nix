{ config, pkgs, ... }:

{
  services.xserver = {
    libinput = {
      enable = true;
      touchpad = {
        accelProfile = "adaptive";
        accelSpeed = "1";
        buttonMapping = "1 2 3";
        disableWhileTyping = false;
        tappingDragLock = false;
        additionalOptions = ''
          Option "TappingDrag" "false"
        '';
      };
    };
  };

}
