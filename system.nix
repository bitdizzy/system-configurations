{ nixpkgs, conf, testArgs ? {} }:

rec {
  testEvaluation = (nixos (testArgs // { basaltSrc = import ./deps/basalt/thunk.nix; })).config // { passthru = null; };

  testConfiguration = { config, pkgs, ... }: {
    imports = [
      (import conf (testArgs // {
        basaltSrc = import ./deps/basalt/thunk.nix;
      }))
    ];
  };

  nixos = args: import "${nixpkgs}/nixos" {
    system = "x86_64-linux";
    configuration = import conf args;
  };

  system = args: (nixos args).system;

}
