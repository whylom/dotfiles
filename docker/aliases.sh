alias d="docker"

alias dc="docker-compose"

alias dc+="docker-compose start"
alias dc-="docker-compose stop"
alias dc~="docker-compose restart"

alias dc++="docker-compose up -d"
alias dc--="docker-compose down"

alias dcx="docker-compose exec app"
alias dbash="docker-compose exec app bash"
alias dlog="docker-compose logs -f"
alias dprune="docker container prune -f && docker volume prune -f"

alias ds="docker-sync"
alias ds+="docker-sync start"
alias ds-="docker-sync stop"
alias ds~="docker-sync stop > /dev/null && docker-sync start > /dev/null"
