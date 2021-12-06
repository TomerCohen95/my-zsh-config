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
alias tmpdir="cd `mktemp -d`"

function subl {
    touch $1
    open -a "Sublime Text" $1
}
function code {
    touch $1
    open $1 -a "Visual Studio Code"
}


#### UTILS ####
alias backup_brew="rm $HOME/.config/brew/Brewfile && brew bundle dump --file $HOME/.config/brew/Brewfile"

function poll {
    eval $1
    while [ $? -ne 0 ]; do
        sleep 1
        eval $1 
    done
}

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









[ -f "$HOME/.workrc" ] && source ~/.workrc # Create a .workrc file if you don't want to commit work related stuff to dotfiles repo

#virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/PycharmProjects
test -e $HOME/.local/bin/virtualenvwrapper.sh && source $HOME/.local/bin/virtualenvwrapper.sh # Different locations in linux/mac
test -e /usr/local/bin/virtualenvwrapper.sh && source /usr/local/bin/virtualenvwrapper.sh


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true # Iterm integration
