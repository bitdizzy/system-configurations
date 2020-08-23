{ openPorts }: { config, pkgs, ... }:

{
  networking = {
    firewall = {
      allowedTCPPorts = openPorts;
    };
  };

}
