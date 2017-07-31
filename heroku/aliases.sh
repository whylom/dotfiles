alias h="heroku"
alias h?="heroku help"
alias h!="heroku run"

alias hc="heroku config"
alias hc!="heroku config:set"
alias hcp="heroku config -r production"
alias hcs="heroku config -r staging"
alias hcp?="heroku config -r production | grep -i"
alias hcs?="heroku config -r staging | grep -i"
alias hcp!="heroku config:set -r production"
alias hcs!="heroku config:set -r staging"

# Temporary overrides
alias h+="run 'git push heroku master'"
alias hl="run 'heroku logs --tail'"
alias c!="run 'heroku run racksh'"
alias db!="run 'heroku pg:psql'"
alias rdbm!="run 'heroku run rake db:migrate'"
