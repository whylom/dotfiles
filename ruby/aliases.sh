alias b="bundle exec"
alias b?="bundle check"
alias bi="run 'bundle install --path=vendor/bundle'"

alias c="run 'bundle exec rails console'"
alias r!="run 'bundle exec rails server'"
alias r-="cat tmp/pids/server.pid | xargs kill -9"
alias r="bundle exec rake"
alias rs="bundle exec rspec"

alias rdbm="run 'bundle exec rake db:migrate'"
alias rdbm~="run 'bundle exec rake db:migrate:redo'"
alias rdbm-="run 'bundle exec rake db:rollback'"

alias s!="run 'spin serve'"
