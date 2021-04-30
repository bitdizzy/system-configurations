{ nixpkgs }: { pkgs, lib, config, ... }:

{
  imports = [
    (import "${nixpkgs}/nixos/modules/profiles/qemu-guest.nix")
  ];

  boot = {
    cleanTmpDir = true;
    loader.grub.device = lib.mkForce "/dev/nvme0n1";
  };
}
