autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

# cheers, @bliker
# https://github.com/bliker/cmder/blob/master/config/git.lua

if (( $+commands[git] )) ; then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_color () {
  if $git diff --quiet --ignore-submodules HEAD 2>/dev/null ; then
    echo "%F{green}$1%f"
  else
    echo "%F{red}$1%f"
  fi
}

git_untracked () {
  if $git status --porcelain 2>/dev/null | grep -q '^??' ; then
    echo "%F{magenta}?%f"
  fi
}

git_need_push () {
  if [[ $($git cherry -v @{upstream} 2>/dev/null) != "" ]] ; then
    echo "%F{magenta}^%f"
  fi
}

git_prompt () {
  local ref
  [ -n "$NO_GIT_PROMPT" ] && return

  ref=$($git symbolic-ref HEAD 2>/dev/null) || return

  ref="${ref#refs/heads/}"
  echo " · $(git_need_push)$(git_color $ref)$(git_untracked)"
}

directory_name () {
  echo "%F{12} %~%f"
}

prompt_prefix () {
  local prefix
  prefix="%F{242}╭─ %f"

  if [[ "$SSH_CONNECTION" != "" ]] ; then
    prefix="(@%{$fg[yellow]%}%m%{$reset_color%}) "
  fi

  echo $prefix
}

export PROMPT=$'$(prompt_prefix)$(directory_name)$(git_prompt)\n%F{242}╰─ %f› '
export RPROMPT=''
if (( $+commands[rbenv] )) ; then
  export RPROMPT=$RPROMPT'(%F{yellow}$(rbenv version-name)%f)'
fi

precmd () {
  # set title if not in tmux
  [ -n "$TMUX" ] || title "zsh" "$USER@%m" "%55<...<%~"
}

preexec () {
  [ -n "$TMUX" ] || title "$1" "$USER@%m" "%35<...<%~"
}

# vim: et:sw=2:sts=2
