{ pkgs, ... }: {
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # misc
    tldr
    cowsay
    gnupg
    gnumake

    # utils
    fzf
    fd
    (ripgrep.override {withPCRE2 = true;})
    jq
    just
    delta # Viewer for git diff output
    hyperfine # CLI benchmarking tool
    doppler
    awscli2
    charm-freeze
    shell_gpt
    poetry

    # archives
    zip
    xz
    unzip
    p7zip

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor
    hydra-check
    nix-index
    nix-init
    nix-melt
    nix-tree

    # productivity
    glow # markdown previewer in terminal
    croc # file transfer

    # browser
    firefox
  ];

  programs = {
    eza = {
      enable = true;
      # Do not enable aliases in nushell!
      enableNushellIntegration = false;
      git = true;
      icons = true;
    };

    bat = {
      enable = true;
      config = {theme = "tokyonight";};
      themes = {
        tokyonight = {
          src =
            pkgs.fetchFromGitHub
            {
              owner = "folke";
              repo = "tokyonight.nvim";
              rev = "9bf9ec53d5e87b025e2404069b71e7ebdc3a13e5";
              sha256 = "sha256-ItCmSUMMTe8iQeneIJLuWedVXsNgm+FXNtdrrdJ/1oE=";
            };
          file = "extras/sublime/tokyonight_night.tmTheme";
        };
      };
    };

    lazygit = {
      enable = true;
      settings = {
        git = {
          paging = {
            colorArg = "always";
            pager = "delta --color-only --dark --paging=never";
            useConfig = false;
          };
        };
      };
    };

    nnn = {
      enable = true;
      # package = pkgs.nnn.override {withNerdIcons = true;};
      # plugins = {
      #   mappings = {
      #     K = "preview-tui";
      #   };
      #   src = pkgs.nnn + "/plugins";
      # };
    };

    yazi = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
