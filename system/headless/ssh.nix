{ config, pkgs, ... }:

let userKeys = import ../keys.nix;
in {
  users.users.root.openssh.authorizedKeys.keys = userKeys.min;
}
