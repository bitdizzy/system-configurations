{ haskellPackages }: { pkgs, lib, ... }:

let xcompose-file = import "${import ./haskell/deps/gen-xcompose/thunk.nix}/output.nix" {
  inherit (pkgs) runCommand; inherit (haskellPackages) gen-xcompose;
};
in {
  home = {
    file = {
      xcompose = {
        source = xcompose-file;
        target = ".XCompose";
      };
    };
  };

}
