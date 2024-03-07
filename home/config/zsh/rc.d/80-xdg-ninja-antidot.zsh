
# [docker]: $HOME/.docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
# [go]: $HOME/go
export GOPATH="$XDG_DATA_HOME"/go
# [postgresql]: $HOME/.psql_history
export PSQL_HISTORY="$XDG_DATA_HOME/psql_history"

mkdir -p "$(dirname "$HISTFILE")"

