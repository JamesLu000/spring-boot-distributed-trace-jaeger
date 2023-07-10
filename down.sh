#!/bin/bash

ps aux | grep Service | grep java | awk {'print $2'} | xargs kill -9 
docker compose down
