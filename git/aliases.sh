alias gb="git branch"
alias gbd="git branch -D"
alias gc="git commit"
alias gca="git commit -a"
alias gco!="git checkout -- ."
alias gcob="git checkout -b"
alias gcom="git checkout master"
alias gcot="run 'git checkout -t'"
alias gf="run 'git fetch root'"
alias gfo="run 'git fetch origin'"
alias gl="git log --pretty=format:'%h %C(yellow)%an%C(reset) %s%C(green)%d%C(reset)'"
alias gld="git log --pretty=format:'%h %C(cyan)%cd %C(yellow)%an%C(reset) %s%C(green)%d%C(reset)' --date=short"
alias gl?="gl -i --grep"
alias gld?="gld -i --grep"
alias gph="run 'git push heroku master'"
alias gm="git merge"
alias gmm="run 'git merge root/master'"
alias gmm!="gcom && gmm && gp"
alias gr="git remote -v"
alias gsc="run 'git stash clear'"
alias gss="git stash save"
alias gsl="git stash list"
alias gsp="git stash pop"
alias gundo="git reset HEAD^ --soft"
