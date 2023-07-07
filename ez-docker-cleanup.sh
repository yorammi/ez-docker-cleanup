#!/bin/bash

# Clean exited processes
docker rm $(docker ps -q -f status=exited)

# Clean dangling volumes
docker volume rm $(docker volume ls -qf dangling=true)

# Clean dangling images
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)

# System prune
docker system prune -a -f --volumes
