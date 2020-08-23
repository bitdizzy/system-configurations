{ nixpkgs }: { pkgs, config, ... }:

{
  imports = [
    (import "${nixpkgs}/nixos/modules/profiles/qemu-guest.nix")
  ];

  boot = {
    cleanTmpDir = true;
    loader.grub.device = "/dev/vda";
  };
}
