{ pkgs, ...}:

let
  customOhMyZshTheme = ''
    ZSH_THEME_GIT_PROMPT_PREFIX="[ %{$fg[magenta]%}\uE0A0 "
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} ]"
    ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
    ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
    ZSH_THEME_GIT_PROMPT_CLEAN=""

    PROMPT='
    [ %{$fg_bold[green]%}%~%{$reset_color%} ][ %{$fg_bold[green]%}%n%{$reset_color%}@%{$fg_bold[magenta]%}%m %{$reset_color%}]$(git_prompt_info)$(virtualenv_prompt_info)%{$reset_color%}[%{$fg_bold[blue]%}%t%{$reset_color%} ]
    > '
  '';
in {
  home.file.".oh-my-zsh/custom/themes/hafus.zsh-theme".text = customOhMyZshTheme;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "dotenv" "fzf" "man" "node" "nodenv" "npm" "pip" "postgres" "pyenv" "qrcode" ];
      theme = "hafus";
    };
  };
}
