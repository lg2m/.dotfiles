{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.modules.ai.codex;

  codexVersion = "0.153.4";

  codexSrc = pkgs.fetchFromGitHub {
    owner = "openai";
    repo = "codex";
    tag = "rust-v${codexVersion}";
    hash = "sha256-lHiDj5SodaM3mh8goMm6esfejeAT+Y3JJWrRnyj6sJo=";
  };

  codex = pkgs.codex.overrideAttrs (
    _finalAttrs: previousAttrs: {
      version = codexVersion;
      src = codexSrc;
      sourceRoot = "${codexSrc.name}/codex-rs";

      cargoDeps = pkgs.rustPlatform.fetchCargoVendor {
        inherit (previousAttrs) pname;
        version = codexVersion;
        src = codexSrc;
        sourceRoot = "${codexSrc.name}/codex-rs";
        hash = "sha256-GG6kOXmCdq+bZLU2ul0DIVL8lDuweayvZvXn6+bcUZw=";
      };
    }
  );
in
{
  options.modules.ai.codex = {
    enable = lib.mkEnableOption "OpenAI Codex CLI coding assistant";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ codex ];
  };
}
