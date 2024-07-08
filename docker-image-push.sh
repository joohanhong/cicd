#!/bin/bash

/usr/bin/docker login -u joohanhong -p ghdwngkstjqj nexus-repo.hongsnet.net:5443

VER="20240706"

/usr/bin/docker tag hongsnet-nginx:latest nexus-repo.hongsnet.net:5443/nginx/hongsnet-nginx:${VER}
/usr/bin/docker push nexus-repo.hongsnet.net:5443/nginx/hongsnet-nginx:${VER}
