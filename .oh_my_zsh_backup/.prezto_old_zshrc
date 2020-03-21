#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Cycle through history based on characters already typed on the line
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
    autoload -U up-line-or-beginning-search
    zle -N up-line-or-beginning-search
    bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
    autoload -U down-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# Aliases
alias school='cd; cd segal.guy@gmail.com/Computer\ Science\ and\ Cognitive\ studies\ Hebrew\ University/Third\ Year/Semester_B'
alias ..='cd ..'
alias ....='cd ..;cd ..'
alias ......='cd ..;cd ..;cd ..'
alias tb='taskbook'
alias aquarium='ssh guyseg%river@gw.cs.huji.ac.il'
alias nvim_swap='cd; cd .local/share/nvim/swap/'
alias ec2_talenya='ssh -i doron.pem ubuntu@ec2-63-35-62-147.eu-west-1.compute.amazonaws.com'
alias samba='/opt/cisco/anyconnect/bin/vpnui'
alias usefull_cmds='cat ~/Desktop/useful_commands'
alias jlab='jupyter lab &> /dev/null &'
alias pdf='f(){okular "$@" &> /dev/null &}; f' # Open a pdf file
alias vim='/usr/bin/nvim'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias lab='cd; cd segal.guy@gmail.com/Computer\ Science\ and\ Cognitive\ studies\ Hebrew\ University/Third\ Year/Loewenstein\ Lab/'
alias books='cd; cd Documents/Books/'
alias j='jobs'
#alias k='f(){kill %"$@"}; f'
alias l='ls -la'
alias files='f(){nautilus "$@" &> /dev/null &}; f' #  open files GUI at "$@" (input)
alias battery='~/.dotfiles/bin/battery'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
