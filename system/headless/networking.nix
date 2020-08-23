{ hostName }: { pkgs, config, ... }:

{
  networking = {
    inherit hostName;
  };
}
