{ config, lib, infra, sources, ... }:

let pkgs = config.my.nixpkgs.default;
    haskellPackages = with config.my.haskell.lib; config.my.haskell.packages.extend (self: super: {
      taffybar = doJailbreak (addPkgconfigDepends (self.callCabal2nix "taffybar" sources.taffybar {}) [pkgs.gtk3]);
    });
    taffybarSources = infra.mapSubdirectories infra.thunkSource ./.;
    chosenTaffybar = taffybarSources.${config.my.taffybar.source};
in {
  options.my.taffybar = with lib; {
    source = mkOption {
      type = types.str;
    };
  };
  config = {
    home = {
      file = {
        taffybar_css = {
          source = "${chosenTaffybar}/taffybar.css";
          target = ".config/taffybar/taffybar.css";
        };
      };
    };

    services = {
      status-notifier-watcher.enable = true;

      taffybar = {
        enable = true;
        package = import "${chosenTaffybar}/default.nix" { inherit haskellPackages; };
      };
    };

    xsession = {
      preferStatusNotifierItems = true;
    };
  };

}
