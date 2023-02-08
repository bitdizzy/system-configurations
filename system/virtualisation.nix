{ virtUsers }: { config, pkgs, ... }:

{
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = virtUsers;

  virtualisation.libvirtd.enable = true;
  users.extraGroups.libvirtd.members = virtUsers;

  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = virtUsers;

}
