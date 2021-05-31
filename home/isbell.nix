{ homeDirectory, taskServerHost, taskServerPort, taskCredentials, privateModules ? [] }: { pkgs, lib, ... }:

let
in rec {
  imports = [
    (import ./common)
    (import ./workstation { inherit homeDirectory taskServerHost taskServerPort taskCredentials; })
    (import ./laptop)
    (import ./daw)
    (import ./theorems)
  ] ++ privateModules;

  home = {
    inherit homeDirectory;
  };

}
