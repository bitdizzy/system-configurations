{ nixpkgsSrc }: { pkgs, lib, ... }:

{
  home = {
    file = {
      defexpr-home = {
        source = nixpkgsSrc;
        target = ".nix-defexpr/home";
      };
    };
  };

  news.display = "silent";

}
