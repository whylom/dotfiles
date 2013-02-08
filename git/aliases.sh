alias gb="git branch"
alias gbd="git branch -D"
alias gc="git commit"
alias gca="git commit -a"
alias gcm="git commit -m"
alias gcam="git commit -a -m"
alias gco!="git checkout -- ."
alias gcob="git checkout -b"
alias gcom="git checkout master"
alias gfr="run 'git fetch root'"
alias gl="git log --pretty=format:'%h %C(yellow)%an%C(reset) %s%C(green)%d%C(reset)'"
alias gld="git log --pretty=format:'%h %C(cyan)%cd %C(yellow)%an%C(reset) %s%C(green)%d%C(reset)' --date=short"
alias gl?="gl -i --grep"
alias gph="run 'git push heroku master'"
alias gm="git merge"
alias gmm="run 'git merge root/master'"
alias gmm!="gcom && gmm && gp"
alias gr="git remote -v"
alias gundo="git reset HEAD^ --soft"
