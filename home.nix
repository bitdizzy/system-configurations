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
        (import home)
      ];

      my.taskwarrior = {
        host = "example.com";
        port = 55555;
        credentials = "";
      };

      home.homeDirectory = "/home/test";
    };
}
