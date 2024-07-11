{ config, pkgs, ... }:

{

  time.timeZone = "America/New_York";

  console = {
    font = "lat9w-16";
    keyMap = "dvorak";
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    #inputMethod = {
    #  enabled = "ibus";
    #};
  };

}
