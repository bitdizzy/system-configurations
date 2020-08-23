{ basaltSrc }: { config, pkgs, ... }:

{

  environment.systemPackages =
    let obelisk = import (import ../../deps/obelisk-internal/thunk.nix) { system = builtins.currentSystem; };
        basalt = import basaltSrc;
     in with pkgs; [
          dnsutils
          parted
          traceroute
          wget
          # nix management
          gitAndTools.gitFull
          basalt.basalt
          obelisk.command
        ];

  programs.zsh = {
    enable = true;
  };

}
