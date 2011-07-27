# emacs
alias emacs='emacs -nw'
alias org='emacs ~/org/main.org'

# xclip
export DISPLAY=:0
alias xclip='awk '\''NR > 1 { print a } { a = $0 } END { printf a }'\'' | xclip -selection clipboard'



