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

export PYROCODE_TOKEN="Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MDAwNWIzMGYzN2QzOWI0NzUwMmMyODEiLCJpYXQiOjE2MTA5NjM2MzMxNjcsImV4cCI6MTYxMDk2MzYzMzE2N30.QatDxnhqplYizifYIbGahhAkz2srZWExNENAr5UQnZTx2Nwn_0m4zayLUoI43KZVBlviQ7u_3l0FTa-noRMsTArclI6sGG2ADeaupA_bq4Elkk6tL95IRShnRwAEWcr6X9V4lbCbzsK60aTPpL9KaHaz7gYiq8kWYtzVjYJYvp7-PosWg-gaL3F_3azBhb_Bb1AGzm7jfbbGryIyGDhFpL2aeRnBWmNP5zcDZubftUbL2YyYAsHEp3CSrnhG0lgMD_QhC3fW1dH7oaGyCRzIFkOwKWvjvW4q_6JK1gQmnc4c75bPeKUd2JYhC_y-5pBsZFz68HEqOYYMePZwmb0ljA4rUR01RGERUOONO5fzel4UoyZ3M2TAMcoe0frYIPZbZ02Uo_rmd3pVm5KF7zVKnBcnigWfAwYQM3_709bOK2hRLMwHrQVyB1IdN-0qtnulcOCp3yavCxiELKRwUb2ef8_vdSc_oO3ldB6wzNzHkPbZrGR5iZL7XXdJN--rmPiN1XtR-2l-WSvzQscZDDo75LnsVqRs4K5ooTOd4VZ65KS_fySS1s1RiUchQb3r-RTaB3E2A6nRe5M7FLBnDer71b6wm1bbUWlkKzbXDhYf0Bw2eHjLMda6-smMm0QB6WdIcRzefYF0iM4zwwqFzaPY39Jm-dSUeh999UOfcRUpdZA"
