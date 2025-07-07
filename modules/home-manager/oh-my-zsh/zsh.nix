{ pkgs, ...}:

let
  customOhMyZshTheme = ''
    function custom_pwd() {
      local nixos_dir="/etc/nixos"
      local pwd="''${PWD}"

      typeset -A abbrev
      abbrev=( [home-manager]=m [default]=d )

      if [[ "$pwd" == "$nixos_dir" ]]; then
        echo "nix-conf"
      elif [[ "$pwd" == "$nixos_dir"/* ]]; then
        local suffix="''${pwd#$nixos_dir/}"
        local parts=("''${(@s:/:)suffix}")

        for i in {1..''${#parts}}; do
          if [[ -n "''${abbrev[''${parts[$i]}]}" ]]; then
            parts[$i]="''${abbrev[''${parts[$i]}]}"
          fi
        done

        echo "nix-conf/''${(j:/:)parts}"
      else
        print -P '%~'
      fi
    }

    PROMPT='[ %{$fg_bold[green]%}$(custom_pwd)%{$reset_color%} ][ %{$fg_bold[green]%}%n%{$reset_color%}@%{$fg_bold[magenta]%}%m %{$reset_color%}]$(git_prompt_info)$(virtualenv_prompt_info)%{$reset_color%}[ %{$fg_bold[blue]%}%t%{$reset_color%} ]
    > '
    ZSH_THEME_GIT_PROMPT_PREFIX="[ %{$fg[magenta]%}\uE0A0 "
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} ]"
    ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
    ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
    ZSH_THEME_GIT_PROMPT_CLEAN=""
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
