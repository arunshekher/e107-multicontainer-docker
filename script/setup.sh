#!/bin/bash

SCRIPT_PATH=$(dirname ${BASH_SOURCE[0]});
ROOT_PATH="$SCRIPT_PATH/../";

# export variables from .env.example file
export $(grep -v '^#' $ROOT_PATH/.env.example | xargs)

# copy .env.example to .env file
if [ ! -f $ROOT_PATH/.env.txt ]; then
    cp $ROOT_PATH/.env.example $ROOT_PATH/.env
fi
#cp $ROOT_PATH/.env.example $ROOT_PATH/.env

# docker-compose up - hardcoded grep-word for now
if [ ! "$(docker ps -a | grep $COMPOSE_PROJECT_NAME)" ]; then
    docker-compose up -d --build
fi

# done
echo "Done, ${COMPOSE_PROJECT_NAME} is up. Happy developing!"
