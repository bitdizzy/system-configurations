{ config, lib, infra, sources, ... }:

{
  options.my.nixpkgs = with lib; {
    default = mkOption {
      type = types.attrs;
      default = config.my.nixpkgs.unstable;
    };

    stable = mkOption {
      type = types.attrs;
      default = import config.my.nixpkgs.stable-src {};
      readOnly = true;
    };

    unstable = mkOption {
      type = types.attrs;
      default = import config.my.nixpkgs.unstable-src {};
      readOnly = true;
    };

    master = mkOption {
      type = types.attrs;
      default = import config.my.nixpkgs.master-src {};
      readOnly = true;
    };

    stable-src = mkOption {
      type = types.path;
      default = sources.nixpkgs-stable;
      readOnly = true;
    };

    unstable-src = mkOption {
      type = types.path;
      default = sources.nixpkgs-unstable;
      readOnly = true;
    };

    master-src = mkOption {
      type = types.path;
      default = sources.nixpkgs-master;
      readOnly = true;
    };
  };

  config = {

    home = {
      file = {
        defexpr-stable = {
          source = config.my.nixpkgs.stable-src;
          target = ".nix-defexpr/stable";
        };
        defexpr-unstable = {
          source = config.my.nixpkgs.unstable-src;
          target = ".nix-defexpr/unstable";
        };
        defexpr-master = {
          source = config.my.nixpkgs.master-src;
          target = ".nix-defexpr/master";
        };
      };

      packages = [
        infra.thunk.command
      ];
    };

    news.display = "silent";
  };
}
