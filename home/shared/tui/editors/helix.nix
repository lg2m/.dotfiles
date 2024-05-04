{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "autumn_night_transparent";
      editor = {
        scrolloff = 8;
        mouse = false;
        middle-click-paste = false;
        scroll-lines = 3;
        shell = [ "sh" "-c" ];
        line-number = "relative";
        cursorline = true;
        cursorcolumn = false;
        gutters = [ "diagnostics" "line-numbers" "spacer" "diff" ];
        auto-completion = true;
        auto-format = true;
        auto-save = false;
        idle-timeout = 100;
        completion-timeout = 100;
        preview-completion-insert = true;
        completion-trigger-len = 3;
        completion-replace = true;
        auto-info = true;
        true-color = true;
        undercurl = false;
        rulers = [ 80 ];
        bufferline = "always";
        color-modes = true;
        text-width = 80;
        insert-final-newline = true;
        popup-border = "all";
        # https://docs.helix-editor.com/configuration.html#editorstatusline-section
        statusline = {
          left =
            [ "mode" "selections" "spinner" "file-name" "total-line-numbers" ];
          center = [ "version-control" ];
          right = [
            "diagnostics"
            "file-encoding"
            "file-line-ending"
            "file-type"
            "position-percentage"
            "position"
          ];
          mode = {
            normal = "N";
            insert = "I";
            select = "S";
          };
        };
        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        file-picker.hidden = false;
        whitespace.characters = {
          space = ".";
          nbsp = "⍽";
          tab = "→";
          newline = "⤶";
        };
        indent-guides = {
          render = true;
          character = "|";
        };
        soft-wrap.enable = true;
      };
      keys = {
        normal = {
          "esc" = [ "normal_mode" ":format" ":write" ];
          "#" = "toggle_comments";
          "{" = "goto_prev_paragraph";
          "}" = "goto_next_paragraph";
          "C-q" = ":xa";
          space = {
            q = ":bc";
            o = "file_picker_in_current_buffer_directory";
            w = { r = ":rla"; };
            u = {
              w = ":set whitespace.render all";
              W = ":set whitespace.render none";
            };
          };
        };
        select = { "%" = "match_brackets"; };
      };
    };

    themes = {
      autumn_night_transparent = {
        "inherits" = "autumn_night";
        "ui.background" = { };
      };
    };

    # define languages
    languages.language = [{
      name = "nix";
      auto-format = true;
      formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
    }];
  };

  # install lsp related packages here
  home.packages = with pkgs; [ nixfmt ];
}
