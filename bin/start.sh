[ ! -z $(docker ps -a --format="{{.Names}}") ] && docker start $(docker ps -a --format="{{.Names}}") 

