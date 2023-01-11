if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

eval "$(starship init zsh)"

_fzf_compgen_path() {
  fd --follow --hidden . "$1"
}
_fzf_compgen_dir() {
  fd --type d --follow --hidden . "$1"
}
export FZF_DEFAULT_COMMAND="fd --follow --hidden -E '/Users/james/Library/Mobile Documents/' -E '/System/Volumes/Data/Users/james/Library/Mobile Documents/' -E '/Users/james/Library/Application Support/CloudDocs/' -E '/System/Volumes/Data/Users/james/Library/Application Support/CloudDocs/'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --follow --hidden -E '/Users/james/Library/Mobile Documents/' -E '/System/Volumes/Data/Users/james/Library/Mobile Documents/' -E '/Users/james/Library/Application Support/CloudDocs/' -E '/System/Volumes/Data/Users/james/Library/Application Support/CloudDocs/' ."

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/james/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

alias python=/usr/bin/python3
PATH=$HOME/Library/Python/3.8/bin:$PATH
PATH=$HOME/.cargo/bin:$PATH
