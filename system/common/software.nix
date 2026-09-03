{ basaltSrc }: { config, pkgs, ... }:

{

  environment.systemPackages =
    let obelisk = import (import ../../deps/obelisk/thunk.nix) { system = builtins.currentSystem; };
        basalt = import basaltSrc;
     in with pkgs; [
          dnsutils
          parted
          traceroute
          wget
          # nix management
          gitFull
          basalt.basalt
          obelisk.command
        ];

  programs.zsh = {
    enable = true;
  };

}
