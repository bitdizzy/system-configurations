{ config, pkgs, ... }:

{

  services.printing = {
    enable = true;
    # drivers = [ pkgs.hplipWithPlugin ];
    browsing = true;
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };

}
