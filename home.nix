{ home, home-manager }:

rec {
  testEvaluation = import "${home-manager}/home-manager/home-manager.nix" {
    confPath = testConfiguration;
    confAttr = null;
  };

  testConfiguration = { pkgs, lib, ... }:
    {
      imports = [
        (import home {
          homeDirectory = "/home/test";
          taskServerHost = "example.com";
          taskServerPort = 55555;
          taskCredentials = "";
        })
      ];
    };
}
