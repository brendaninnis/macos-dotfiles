export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Add Homebrew to path
eval "$(/opt/homebrew/bin/brew shellenv)"

# Active rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Setup pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Always use Neovim
export EDITOR='vim'
alias vi="nvim"
alias vim="nvim"

# Postgresql
export PGPASSFILE="$HOME/.pgpass"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
