#!/bin/bash
docker run -ti \
-v "$(pwd)"/data:/media/data \
-v "$(pwd)"/conf:/root/.config/storjshare \
-p 4000:4000 \
--name storj \
brunneis/storj
