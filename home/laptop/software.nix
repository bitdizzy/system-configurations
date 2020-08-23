{ pkgs, lib, ... }:

{
  home = {
    packages = with pkgs; [
      acpi
    ];
  };

}
