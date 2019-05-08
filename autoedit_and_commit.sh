#!/bin/bash

NEW_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

sed "s/echo/echo ${NEW_UUID}/" Dockerfile > Dockerfile.tmp
mv Dockerfile.tmp Dockerfile
git add Dockerfile
git commit -m "d"
git push
