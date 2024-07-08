#!/bin/bash

/usr/bin/docker images -f "dangling=true" -q

/usr/bin/docker rmi $(docker images -f "dangling=true" -q)

/usr/bin/docker images
