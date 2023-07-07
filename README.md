# ez-docker-cleanup
![ez logo](/resources/images/ez/ez-smiley-small-logo.png)

## About

A docker-container that runs a script, which activates the following commands:

Clean exited processes:
```docker rm $(docker ps -q -f status=exited)```

Clean dangling volumes:
```docker volume rm $(docker volume ls -qf dangling=true)```

Clean dangling images:
```docker rmi $(docker images --filter "dangling=true" -q --no-trunc)```

System prune:
```docker system prune -a -f --volumes```

## How to use

All you need to do is to run:
```docker run -v /var/run/docker.sock:/var/run/docker.sock yorammi/ez-docker-cleanup:latest```
