#!/usr/bin/env bash
docker run -v $PWD/h2-data:/opt/h2-data -d -p 9092:9092 -p 8080:8080 --name=h2 h2
docker logs -f h2 2>&1
#xdg-open http://localhost:8080/
