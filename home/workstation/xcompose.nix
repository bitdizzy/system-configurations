{ pkgs, lib, ... }:

{
  home = {
    file = {
      xcompose = {
        source = ./xcompose/XCompose;
        target = ".XCompose";
      };
    };
  };

}
