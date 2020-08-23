{ homeDirectory, taskServerHost, taskServerPort, taskCredentials, privateModules ? [] }: { pkgs, lib, ... }:

rec {
  imports = [
    (import ./common)
    (import ./workstation { inherit homeDirectory taskServerHost taskServerPort taskCredentials; })
    (import ./personal)
    (import ./yubikey.nix)
  ] ++ privateModules;

  home = {
    inherit homeDirectory;
  };

}

