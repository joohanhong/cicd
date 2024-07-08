#!/bin/bash

cd /home/mon-api;pm2 start ecosystem.config.js --env production
