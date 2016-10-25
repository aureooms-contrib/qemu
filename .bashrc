# disable Software Control Flow (c-s,c-q)
# http://unix.stackexchange.com/questions/72086/ctrl-s-hang-terminal-emulator
stty -ixon

# Add `~/.bin` to the `$PATH`
if [ -d "$HOME/.bin" ] ; then
	export PATH="$HOME/.bin:$PATH";
fi

alias r=ranger
alias q=exit
