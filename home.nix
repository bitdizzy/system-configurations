{ pkgs, home, home-manager }:

rec {
  testEvaluation = import "${home-manager}/home-manager/home-manager.nix" {
    inherit pkgs;
    confPath = testConfiguration;
    confAttr = null;
  };

  testConfiguration = { ... }:
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
