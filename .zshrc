typeset -U path cdpath fpath manpath

bindkey -v

# eval "$(/usr/libexec/path_helper)"

export EDITOR="nvim"

source /usr/share/zsh/scripts/zplug/init.zsh

zplug "zdharma-continuum/fast-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

if ! zplug check; then
    zplug install
fi

export FZF_DEFAULT_COMMAND="rg --files"

zplug load

HISTSIZE="100000"
SAVEHIST="100000"

HISTFILE="$HOME/.config/zsh/zsh_history"
mkdir -p "$(dirname "$HISTFILE")"
dotDir="$HOME/.config/zsh"


setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
unsetopt HIST_EXPIRE_DUPS_FIRST
setopt autocd

autoload -U colors && colors
PS1="%{$fg[red]%}[ %{$fg[blue]%}%~%{$fg[red]%} ]%}%{$fg[yellow]%} %{$reset_color%}"

preexec() { print -Pn "\e]0;$1\a" }

_comp_options+=(globdots)

cm() {
    mkdir $@;
    cd $@
}

docx-pdf() {
soffice --convert-to pdf $@;
rm $@
}

nnn-cd () {
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The command builtin allows one to alias nnn to n, if desired, without
    # making an infinitely recursive alias
    command nnn "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f -- "$NNN_TMPFILE" > /dev/null
    }
}

alias dops="docker ps"
alias dlog="docker logs"
alias dlogf="docker logs -f"

bindkey -s '^o' 'fzf-cd\n'
bindkey -s '^k' 'fzf-kill\n'
bindkey -s '^a' 'bc -lq\n'
bindkey -s '^f' nnn-cd

alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gs="git status"
alias gsb="git status -sb"
alias ".."="cd .."
alias l="ls -lF"
alias la="l -a"
alias ll="ls -l"
alias ls="ls --group-directories-first --color"
alias cp="cp -iv"
alias mv="mv -iv"
alias sxiv="sxiv -b"
alias ytdl="yt-dlp"
alias ytdla="yt-dlp -x --audio-format mp3"
alias fzf-yt="nix-shell -p jq ueberzug && ytfzf"
alias grep="grep --colour=auto"
alias dirdu="du -ah . | sort -hr | head -n 20"
alias vim="nvim"
alias icloud-download="ICLOUD_EMAIL=bernardoquintao@icloud.com icloud-download"
alias pamcan='pacman'

# nnn config

export NNN_FIFO="/tmp/nnn.fifo"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export NNN_BMS='d:~/Documents;h:~/;D:~/Downloads/'
export BLK="0B"
export CHR="0B"
export DIR="04"
export EXE="02"
export REG="00"
export HARDLINK="06"
export SYMLINK="06"
export MISSING="00"
export ORPHAN="09"
export FIFO="06"
export SOCK="0B"
export OTHER="06"
export NNN_PLUG='f:fzopen;t:nmount;v:imgview'

if [ -f /usr/share/nnn/quitcd/quitcd.bash_sh_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_sh_zsh
fi

export FZF_DEFAULT_COMMAND="rg --files"
export FZF_DEFAULT_OPTS="-m --height 50% --border"

export PATH="/home/basqs/.cargo/bin:$PATH"
export PATH="/home/basqs/.local/bin:$PATH"

vterm_printf(){
    if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ] ); then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# [ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}