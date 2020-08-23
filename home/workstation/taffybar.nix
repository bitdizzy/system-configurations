{ haskellPackages }: { pkgs, lib, ... }:

{
  home = {
    file = {
      taffybar_css = {
        source = ./taffybar/taffybar.css;
        target = ".config/taffybar/taffybar.css";
      };
    };
  };

  services = {
    status-notifier-watcher.enable = true;

    taffybar = {
      enable = true;
      package = import ./taffybar { inherit haskellPackages; };
    };
  };

  xsession = {
    preferStatusNotifierItems = true;
  };

}
