{ externalHost, taskServerPort, adminEmail, taskUsers }: { config, pkgs, ... }:

{
  security.acme = {
    acceptTerms = true;
    email = adminEmail;
  };

  services = {
    monero = {
      enable = false;
      extraConfig = ''
        restricted-rpc=1
      '';
      limits.threads = 4;
    };

    nginx = {
      enable = true;
      recommendedGzipSettings = true;
      recommendedOptimisation = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;
      virtualHosts = {
        "${externalHost}" = {
          forceSSL = true;
          enableACME = true;
          locations."/" = {
            proxyPass = "https://127.0.0.1:8000/";
            proxyWebsockets = true;
          };
        };
      };
    };

    taskserver = {
      enable = true;
      fqdn = externalHost;
      organisations.perso.users = taskUsers;
      debug = true;
      ipLog = true;
      listenHost = externalHost;
      listenPort = taskServerPort;
    };
  };

}
