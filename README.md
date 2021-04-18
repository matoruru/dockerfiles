# dockerfiles

My useful dockerfiles that contains fish, neovim, node and so on...

## Prepare

1. Set these environment variables that will be needed on build time:

    - USER_NAME (default `$USER`)
    - HOST_HOME (default `$HOME`)
    - GITHUB_USER_NAME

1. Customize it as you want.

    I tried to put less but these dockerfiles are still being too much specialized for me. If you want other editor, IDE or other stuff just remove my any things and then replace them with what you like. But I'm sure you still can use `base-yay` image that contains only basic packages.

## How to use

Build the image:

```sh
$ docker-compose build
```

Run the image:

```sh
# As a single-use
$ docker run --rm -it -v $HOME:$HOME useful

# As a daemon
$ docker run --rm -itd -v $HOME:$HOME useful
a1b2c3.....
$ docker exec -it a1b bash
```

## Useful aliases (fish)

Aliases and functions that are helping my daily life.

```fish
# Run the `useful` image as a single-use container.
alias runuo="docker run --rm -it -v $HOME:$HOME useful"

# Run the `useful` image as a daemon.
alias runud="docker run --rm -itd -v $HOME:$HOME useful"

# Enter the container with its ID.
function econ
  set -l container_id $argv[1]
  if echo $container_id | grep -qE '^ *+$'
    echo Specify the container ID that you want to enter!
  else
    docker exec -it $container_id bash
  end
end

# List active docker containers and images.
function dls
    set -l green (tput setaf 2)
    set -l default (tput sgr0)
    echo $green"[Images]"$default
    docker image ls
    echo
    echo $green"[Running containers]"$default
    docker container ls
end
```
