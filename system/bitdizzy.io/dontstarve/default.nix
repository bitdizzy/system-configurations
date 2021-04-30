{ stdenv, lib, clusterTokenFile, clusterPassword }:

let modList = [
      596633787 # Display Food Values
      345692228 # Minimap HUD
      351325790 # Geometric Placement
      378160973 # Global Position
    ];
    mods_setup = builtins.toFile "dedicated_server_mods_setup.lua"
      (builtins.concatStringsSep "\n" (map (m: ''ServerModSetup("${toString m}")'') modList));
    modoverride = builtins.toFile "modoverrides.lua" ''
      return {
      ${builtins.concatStringsSep ",\n" (map (m: ''["workshop-${toString m}"]={enabled = true}'') modList)}
      }
    '';
in stdenv.mkDerivation rec {
  pname = "dst-cluster-config";
  version = "0";

  src = ./.;
  outputs = [ "out" "modconf" ];

  installPhase = ''
    runHook preInstall

    mkdir -p "$out"
    cp -r Caves "$out"
    cp -r Master "$out"
    cp ${modoverride} "$out"/Caves/modoverrides.lua
    cp ${modoverride} "$out"/Master/modoverrides.lua
    substitute cluster.ini "$out"/cluster.ini \
      --subst-var-by PASSWORD ${clusterPassword}
    cp ${clusterTokenFile} "$out"/cluster_token.txt

    mkdir -p "$modconf"
    cp ${mods_setup} "$modconf"/dedicated_server_mods_setup.lua
  '';
}
