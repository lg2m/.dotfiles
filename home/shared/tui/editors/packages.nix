{ pkgs, ... }: {
  nixpkgs.config = {
    programs.npm.npmrc = ''
      prefix = ''${HOME}/.npm-global
    '';
  };

  home.packages = with pkgs; [
    # Bash
    nodePackages.bash-language-server
    shellcheck
    shfmt
    
    # C/Cpp
    cmake
    cmake-language-server
    gnumake
    checkmake
    gcc
    llvmPackages.clang-unwrapped
    lldb

    # Go
    go
    gomodifytags
    iferr
    impl
    gotools
    gopls
    delve

    # Javascript / Typescript
    nodePackages.nodejs
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages."@tailwindcss/language-server"
    emmet-ls

    # Lua
    stylua
    lua-language-server

    # Nix
    nil
    statix
    deadnix
    alejandra

    # Python
    nodePackages.pyright
    (python311.withPackages (
      ps:
        with ps; [
          ruff-lsp
          black
          debugpy
        ]
    ))

    # Rust
    rust-analyzer
    cargo
    rustfmt

    # Cloud
    terraform-ls
    hadolint

    # Etc
    taplo # TOML
    nodePackages.yaml-language-server
    marksman
    jsonnet
    jsonnet-language-server
    
    # Misc
    tree-sitter
    nodePackages.prettier
  ];
}
