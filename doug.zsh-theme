# Theme with full path names and hostname
# Handy if you work on different servers all the time;
PROMPT='%{$fg[cyan]%}╭─ %n%{$reset_color%}@%{$fg[green]%}%/%{$reset_color%}$(git_prompt_info)
%{$fg[cyan]%}╰─ %{$fg[blue]%}λ % %{$reset_color%}'


ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX=']'
