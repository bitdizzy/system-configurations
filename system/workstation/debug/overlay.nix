self: super:

# Thanks timor :)
let timor-overlay = import ./deps/timor-overlay/thunk.nix;
in {
  debugify = import "${timor-overlay}/pkgs/gdbForPackages/debugify.nix";
  gdbForPackages = self.callPackage "${timor-overlay}/pkgs/gdbForPackages" { };
  gdbForPackage = (pkg: self.gdbForPackages [pkg]);

}
