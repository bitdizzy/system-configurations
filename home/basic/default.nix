{ config, lib, ... }:

let
  pkgs = config.my.nixpkgs.default;
  # Set up how we deal with variations of machines
  optionModule = {
    options.my = with lib; {
      machine = {
        # what sort of machine is it?
        flavor = mkOption {
          type = types.enum [
            "laptop"
            "desktop"
            "server"
            "router"
          ];
          description = "What sort of machine is this?";
        };
      };
    };
  };
  # Certain machines, such as laptops, need more utilities for interfacing with their hardware
  hardwareModule = {
    home.packages = lib.optional (config.my.machine.flavor == "laptop") pkgs.acpi;
  };
  # Sets up the nix environment for the machine: which nixpkgs do we use?
  nixModule = import ./nix;
  # Sets up the bare minimum of a CLI environment
  cliModule = {

    imports = [
      # vim configuration is a big chungus
      (import ./vim)
    ];

    home = {

      sessionVariables = {
        # zsh will tell us how long it took to run slow commands
        REPORTTIME = 1;
      };

      # set up git configuration and support
      file = {
        git_config = {
          source = ./git/config;
          target = ".gitconfig";
        };
      };

      packages = with pkgs; [
        # misc. utilities
        calc
        p7zip
        # better search tools
        fzf
        silver-searcher
      ] # perf monitoring on linux
      ++ lib.optionals pkgs.stdenv.isLinux [
        iotop
        nethogs
      ];

    };

    programs = {
      # better top on all machines
      htop.enable = true;

      # ssh of course
      ssh.enable = true;

      # zsh integrations
      zsh = rec {
        enable = true;
        dotDir = "zsh";
        history.path = "${config.home.homeDirectory}/${dotDir}/.zsh_history";
        oh-my-zsh = {
          enable = true;
          plugins = [
            "git"
          ];
        };
        initExtra = ''
          setopt PromptSp
          export FZF_DEFAULT_COMMAND='ag -i -g ""'
        '';
      };
    };

  };
in {
  imports = [
    optionModule
    hardwareModule
    nixModule
    cliModule
  ];
}
