{ numBuildCores, nixpkgs, configurationSrc }: { config, lib, pkgs, ...}:

{
  nix = {

    nrBuildUsers = numBuildCores * 2;
    nixPath = [
      "nixpkgs=${nixpkgs}"
      "nixos-config=${configurationSrc}"
      "nixpkgs-overlays=${../../overlays}"
    ];

    settings = {
      trusted-public-keys = [
        # "ryantrinkle.com-1:JJiAKaRv9mWgpVAz8dwewnZe0AzzEAzPkagE9SP5NWI="
        # "1365.webhop.org-1:jrz/Z6UBFafWsuArR96ghoQdNCkPlxKB0IwXdM4zAsc="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      ];
      substituters = [
        "https://cache.nixos.org/"
        # "https://nixcache.reflex-frp.org"
        # "http://1365.webhop.org:5000"
      ];
      cores = numBuildCores;
      max-jobs = lib.mkDefault numBuildCores;
      trusted-users = [ "@wheel" ];
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

}
