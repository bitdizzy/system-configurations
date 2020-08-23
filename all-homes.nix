{ home-manager ? import ./deps/home-manager/thunk.nix
}:

let evalConf = home: (import ./home.nix {
      inherit home-manager home;
    });
in rec {
  testEvaluation = map (x: x.testEvaluation) (builtins.attrValues homes);
  homes = {
    isbell = evalConf ./home/isbell.nix;
    lucy = evalConf ./home/lucy.nix;
  };
}
