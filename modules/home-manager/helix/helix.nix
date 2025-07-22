{
  home.file.".config/helix/themes" = {
    source = ./themes;
    recursive = true;
  };
  programs.helix = {
    enable = true;
    settings = {
      theme = "macchiato";
      editor = {
        line-number = "absolute";
        lsp.enable = true;
        soft-wrap.enable = true;
        search.smart-case = true;
        lsp.display-messages = true;
      };
      editor.statusline = {
        left = [ "mode" "spinner" ];
        center =
          [ "file-name" "file-modification-indicator" "read-only-indicator" ];
        right = [ "diagnostics" "position" "file-type" ];
        separator = "│";
        mode.normal = "normal";
        mode.insert = "insert";
        mode.select = "select";
      };
    };
  };
}
