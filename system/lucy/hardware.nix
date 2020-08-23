{ config, pkgs, ... }:

{
  hardware = {
    mwProCapture.enable = true;
  };

  services.udev.packages =
    let rule = ''
          SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="057e", ATTRS{idProduct}=="0337", MODE="0666";
        '';
        gcnAdapter51 = pkgs.writeTextFile {
          name = "gcnAdapter51";
          text = rule;
          executable = false;
          destination = "/etc/udev/rules.d/51-gcadapter.rules";
          checkPhase = "";
        };
    in [ gcnAdapter51 pkgs.yubikey-personalization pkgs.libu2f-host ];

    services.pcscd.enable = true;
}
