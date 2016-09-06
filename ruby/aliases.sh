alias b="bundle exec"
alias b?="bundle check"
alias bi="run 'bundle install --path=vendor/bundle'"

alias c="run 'bundle exec rails console'"

alias r="bundle exec rake"

alias r-="cat tmp/pids/server.pid | xargs kill -9"
alias r!="run 'bundle exec rails server'"

alias rdbm="run 'bundle exec rake db:migrate'"
alias rdbm~="run 'bundle exec rake db:migrate:redo'"
alias rdbm-="run 'bundle exec rake db:rollback'"

alias rs="bundle exec rspec"

alias s!="run 'spin serve'"
