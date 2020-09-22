{ compiler, pkgs }:

with pkgs.haskell.lib; let
  gi-cairo-render-src = pkgs.fetchFromGitHub {
    owner = "cohomology";
    repo = "gi-cairo-render";
    rev = "051de28ff092e0be0dc28612c6acb715a8bca846";
    sha256 = "1v9kdycc91hh5s41n2i1dw2x6lxp9s1lnnb3qj6vy107qv8i4p6s";
  };
in
pkgs.haskell.packages.${compiler}.extend (self: super: {
  gi-cairo-render = markUnbroken (overrideCabal (super.gi-cairo-render)
    (drv: {
      src = gi-cairo-render-src;
      editedCabalFile = null;
      postUnpack = ''
        mv source all
        mv all/gi-cairo-render source
      '';
    }));
  gi-cairo-connector = markUnbroken
    (overrideCabal (super.gi-cairo-connector) (drv: {
      src = gi-cairo-render-src;
      editedCabalFile = null;
      postUnpack = ''
        mv source all
        mv all/gi-cairo-connector source
      '';
    }));
  gi-dbusmenu = markUnbroken (self.gi-dbusmenu_0_4_8);
  gi-dbusmenugtk3 = markUnbroken (self.gi-dbusmenugtk3_0_4_9);
  gi-gdk = self.gi-gdk_3_0_23;
  gi-gdkx11 = markUnbroken (overrideSrc super.gi-gdkx11 {
    src = pkgs.fetchurl {
      url = "https://hackage.haskell.org/package/gi-gdkx11-3.0.10/gi-gdkx11-3.0.10.tar.gz";
      sha256 = "0kfn4l5jqhllz514zw5cxf7181ybb5c11r680nwhr99b97yy0q9f";
    };
    version = "3.0.10";
  });
  gi-gtk-hs = markUnbroken (self.gi-gtk-hs_0_3_9);
  gi-xlib = markUnbroken (self.gi-xlib_2_0_9);
  gtk-sni-tray = markUnbroken (super.gtk-sni-tray);
  gtk-strut = markUnbroken (super.gtk-strut);
  taffybar = let
    giCompatPatch = pkgs.fetchpatch {
      url = "https://github.com/taffybar/taffybar/pull/494/commits/a7443324a549617f04d49c6dfeaf53f945dc2b98.patch";
      sha256 = "0prskimfpapgncwc8si51lf0zxkkdghn33y3ysjky9a82dsbhcqi";
    };
    taffyBarFork = addPkgconfigDepends (doJailbreak (self.callCabal2nix "taffybar" (import ./haskell/deps/taffybar/thunk.nix) {})) [pkgs.gtk3];
  in appendPatch taffyBarFork giCompatPatch;
  xmonad-contrib = doJailbreak (self.callCabal2nix "xmonad-contrib" (import ./haskell/deps/xmonad-contrib/thunk.nix) {});
})
