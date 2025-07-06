{ pkgs, ...}:

# let
#   customOhMyZshTheme = ''
#     autoload -U colors && colors
#     PROMPT='%{''${fg_bold[white]}%}[%{''${fg[blue]}%}%t %{''${fg_bold[white]}%}] %{''${fg_bold[white]}%}[ %{''${fg[green]}%}%n%{$reset_color%}@%{''${fg[magenta]}%}%m %{''${fg[blue]}%}%~''$(git_prompt_info) %{''${fg_bold[white]}% ]%{$reset_color%}
#     > '
#     ZSH_THEME_GIT_PROMPT_PREFIX="%{''${fg_bold[yellow]}%}:("
#     ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
#     ZSH_THEME_GIT_PROMPT_CLEAN=" | ok"
#     ZSH_THEME_GIT_PROMPT_DIRTY=" | x"
#   '';
# in
{
  # home.file.".oh-my-zsh/custom/themes/hafus.zsh-theme".text = customOhMyZshTheme;

  # programs.fzf = {
  #   enable = true;
  #   enableZshIntegration = true;
  # };

  programs.zsh = {
    enable = true;
    # syntaxHighlighting.enable = true;
    # enableCompletion = true;
    # autosuggestion.enable = true;
    # plugins = [
    #   {
    #     name = "zsh-syntax-highlighting";
    #     src = pkgs.zsh-syntax-highlighting;
    #     file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
    #   }
    # ];
    # oh-my-zsh = {
    #   enable = true;
    #   plugins = [ "git" "dotenv" "fzf" "man" "node" "nodenv" "npm" "pip" "postgres" "pyenv" "qrcode" ];
    #   theme = "hafus";
    # };
  };
}
