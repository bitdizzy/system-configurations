{ nixpkgs ? import ./deps/nixpkgs-unstable/thunk.nix
}:

let evalConf = machine: (import ./system.nix (machine // { inherit nixpkgs; }));
in rec {
  testEvaluation = map (x: x.testEvaluation) (builtins.attrValues machines);
  machines = {
    isbell = evalConf {
      conf = ./system/isbell.nix;
      testArgs = {
        virtUsers = [];
      };
    };

    lucy = evalConf {
      conf = ./system/lucy.nix;
      testArgs = {
        openPorts = [];
        externalHost = "example.com";
        taskServerPort = 55555;
        adminEmail = "example@example.com";
        taskUsers = [];
        virtUsers = [];
      };
    };

    bitdizzyio = evalConf {
      conf = ./system/bitdizzy.io.nix;
      testArgs = {
        openPorts = [];
        externalHost = "example.com";
        adminEmail = "example@example.com";
        dontStarveSecret = (import nixpkgs {}).writeTextFile {
                name = "test";
                text = "uwu";
        };
      };
    };
  };
}
