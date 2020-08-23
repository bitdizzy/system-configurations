{ config, pkgs, ... }:

{
  security.pam.services = {
    lightdm.enableKwallet = true;
  };

  environment.systemPackages = with pkgs; [
    # Secrets for stupid apps like Okta that I don't want mucking with my password store
    kdeFrameworks.kwallet
    kdeApplications.kwalletmanager
  ];

}
