{ hostName }: { config, pkgs, ... }:

{
  networking = {
    inherit hostName;

    networkmanager.enable = true;
    dhcpcd.extraConfig =
      '' static domain_name_servers=8.8.8.8 8.8.4.4
      '';
    extraHosts =
      '' 127.0.0.1 localhost.dev
         127.0.0.1 test.localhost.dev
      '';
    firewall.allowedTCPPorts = [ 8000 3911 ];
  };
}
