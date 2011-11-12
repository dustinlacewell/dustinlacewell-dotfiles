# xclip
export DISPLAY=:0
alias xclip='awk '\''NR > 1 { print a } { a = $0 } END { printf a }'\'' | xclip -selection clipboard'

# git
alias gp='git commit -am "."; git push'

# remove all pyc (recursive)
alias rmpyc='find . -name "*.pyc" -exec rm -rf {} \;'

