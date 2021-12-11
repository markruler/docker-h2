# docker-h2

Dockerized H2 database service.

## Features

- Based on [the `OpenJDK` official image](https://hub.docker.com/r/_/openjdk/)
- H2-DATA location on `/opt/h2-data`
- A mix of [zhilvis/docker-h2](https://github.com/zhilvis/docker-h2) and [zilvinasu/h2-dockerfile](https://github.com/zilvinasu/h2-dockerfile).
  - [oscarfonts/docker-h2](https://github.com/oscarfonts/docker-h2)

## Trusted builds

[Automated builds](https://hub.docker.com/r/markruler/h2/tags) on [docker registry](https://registry.hub.docker.com/):

- [`latest`, `1.4.200` (*1.4.200/Dockerfile*)](1.4.200/Dockerfile)
- [H2 Archive Downloads](https://www.h2database.com/html/download-archive.html)

## Running

Get the image:

```bash
docker pull markruler/h2
```

Run as a service, exposing ports 1521 (TCP database server) and 81 (web interface) and mapping DATA_DIR to host:

```bash
docker run -d \
  -p 1521:1521 \
  -p 81:81 \
  -v /path/to/local/data_dir:/opt/h2-data \
  --name=MyH2Instance \
  markruler/h2
```

Or run as a service with an extra custom config set in the command line, like allowing to create database at connection:

```bash
docker run -d \
  -p 1521:1521 \
  -p 81:81 \
  -v /path/to/local/data_dir:/opt/h2-data \
  -e H2_OPTIONS=-ifNotExists \ # this
  --name=MyH2Instance \
  markruler/h2
```

The H2 web console will be available at: `http://localhost:81`

See the logs while running:

```bash
docker logs -f MyH2Instance
```
