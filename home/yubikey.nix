{ pkgs, lib, ... }:

{
  home = {
    packages = with pkgs; [
      yubikey-personalization
    ];
  };

}
