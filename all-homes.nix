{ pkgs ? import (import ./deps/nixpkgs-unstable/thunk.nix) {}
, home-manager ? import ./deps/home-manager-unstable/thunk.nix
}:

let evalConf = home: (import ./home.nix {
      inherit pkgs home-manager home;
    });
in rec {
  testEvaluation = map (x: x.testEvaluation) (builtins.attrValues homes);
  homes = {
    isbell = evalConf ./home/isbell.nix;
    lucy = evalConf ./home/lucy.nix;
    eliza = evalConf ./home/eliza.nix;
  };
}
