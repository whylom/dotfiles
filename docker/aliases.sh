alias d="docker"

alias dc="docker-compose"

alias dc+="docker-compose start"
alias dc-="docker-compose stop"
alias dc~="docker-compose restart"

alias dc++="docker-compose up -d"
alias dc--="docker-compose down"
alias dc~~="dc-- && dc++"

alias dcx="docker-compose exec"
alias dprune="docker container prune -f && docker volume prune -f"

alias ds="docker-sync"
alias ds+="docker-sync start"
alias ds-="docker-sync stop"
alias ds~="docker-sync stop && docker-sync start"
