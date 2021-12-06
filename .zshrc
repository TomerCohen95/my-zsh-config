export ZSH="/Users/tomercohen/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
        git
        zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

#### EXPLORE FASTER ####
alias prof="vim ~/.zshrc"
alias dev="cd ~/dev"
alias chrm="open -a \"Google Chrome\""

#### PYTHON ####
alias pkgs="pipenv run pip freeze"
alias fpkgs="pkgs | grep"
alias src="source venv/bin/activate"

#### DOCKER ####
alias dc="docker-compose"
alias dcl="dc logs"
alias dclf="dcl -f"
alias dcs="dc stop"
alias dcu="dc up -d"
alias dcd="dc down"
alias dps="docker ps"

#### KUBERNETES ####
alias kapply='kubectl apply -f .'
alias kc='kubectl'
alias kcl='kc logs'
alias kcg='kc get'
alias kcdes='kc describe'
alias kcdel='kc delete'
