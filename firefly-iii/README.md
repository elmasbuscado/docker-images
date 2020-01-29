[![Build Status](https://img.shields.io/travis/SuperSandro2000/docker-images.svg?maxAge=3600)](https://travis-ci.org/SuperSandro2000/docker-images)
[![Github Stars](https://img.shields.io/github/stars/supersandro2000/docker-images.svg?maxAge=3600&label=Stars)](https://github.com/SuperSandro2000/docker-images)

# Firefly III

[![Docker Hub](https://img.shields.io/badge/Docker-hub-blue.svg)](https://hub.docker.com/r/supersandro2000/firefly-iii/)
[![GitHub readme](https://img.shields.io/badge/GitHub-readme-blue.svg)](https://github.com/SuperSandro2000/docker-images/blob/master/firefly-iii/README.md)
[![Microbadger](https://images.microbadger.com/badges/image/supersandro2000/firefly-iii.svg)](https://microbadger.com/images/supersandro2000/firefly-iii)
[![Docker Stars](https://img.shields.io/docker/stars/supersandro2000/firefly-iii.svg?maxAge=3600)](https://hub.docker.com/r/supersandro2000/firefly-iii/)
[![Docker Pulls](https://img.shields.io/docker/pulls/supersandro2000/firefly-iii.svg?maxAge=3600)](https://hub.docker.com/r/supersandro2000/firefly-iii/)

Firefly III Docker Image

For configuration see https://github.com/firefly-iii/firefly-iii/blob/master/.env.example

## Docker compose

````yaml
---
version: "3"
services:
  firefly-iii:
    image: supersandro2000/firefly-iii
    enviroment:
     - ...
    restart: unless-stopped
````