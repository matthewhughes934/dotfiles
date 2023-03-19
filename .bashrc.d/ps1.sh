white="\033[37;0m"
bold_cyan="\033[36;1m"
PS1="\[$bold_cyan\]\$PWD\[$white\]$ "

if [ -n "${SSH_TTY:-}" ]
then
    PS1="\u@\H:$PS1"
fi
