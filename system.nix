{ nixpkgs, conf, testArgs ? {} }:

rec {
  testNixos = (nixos (testArgs // {
    basaltSrc = import ./deps/basalt/thunk.nix;
    configurationSrc = ""; # What could I reasonably put here?
  }));

  testEvaluation = testNixos.config // { passthru = null; };

  testBuild = testNixos.system;

  nixos = args: import "${nixpkgs}/nixos" {
    system = "x86_64-linux";
    configuration = import conf args;
  };

  system = args: (nixos args).system;

}
