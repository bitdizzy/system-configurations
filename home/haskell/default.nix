{ config, lib, ... }:

{
  options.my.haskell = with lib;
    let pkgs = config.my.nixpkgs.default;
    in {
      packages = mkOption {
        type = types.attrs;
        readOnly = true;
        default = config.my.haskell.packagesFun (pkgs.haskell.packages.${config.my.haskell.compiler});
      };

      lib = mkOption {
        type = types.attrs;
        readOnly = true;
        default = pkgs.haskell.lib;
      };

      packagesFun = mkOption {
        type = types.functionTo types.attrs;
        # TODO: Let the user pass in a list of extensions
        # but the order of extensions is very important,
        # so anything that needs to be overridden needs to
        # be combined thoughtfully.
        default = x: x.extend (self: super: {
        });
      };

      compiler = mkOption {
        type = types.str;
        default = "ghc902";
      };
    };
}
