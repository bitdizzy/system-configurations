{ unstablePkgs }: {  pkgs, lib, ... }:

{
  home = {
    packages = with pkgs; [
      unstablePkgs.coq
    ];
  };

}
