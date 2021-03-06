alias b="bundle exec"
alias b?="bundle check"
alias bi="bundle install"

alias c="docker-compose exec app rails console"

alias db="run 'bundle exec rails dbconsole'"

alias r="bundle exec rake"
alias routes?="bundle exec rake routes | grep"

alias r-="cat tmp/pids/server.pid | xargs kill -9"
alias r!="bundle exec rails server -p 3001"
alias rd!="bundle exec rails server -p 3001 -d"

alias rdbm="run 'bundle exec rake db:migrate'"
alias rdbm~="run 'bundle exec rake db:migrate:redo'"
alias rdbm-="run 'bundle exec rake db:rollback'"

alias rs="bundle exec rspec"

alias s!="run 'spin serve'"
