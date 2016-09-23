# docker-gophish

> A docker image for the Gophish web application

[![Build details](https://img.shields.io/badge/build%20details-success-brightgreen.svg)](https://hub.docker.com/r/ulissescastro/gophish/builds) [![Docker Pulls](https://img.shields.io/docker/pulls/ulissescastro/gophish.svg)](https://hub.docker.com/r/ulissescastro/gophish)


## Description

This is a quick way to deploy a [gophish](https://github.com/gophish/gophish) installation on your local machine.

The latest version is running on the official Ubuntu Trusty container.

## Usage

#### Quickstart

```bash
docker run -ti --name gophish -p 3333:3333 -p 8083:80 ulissescastro/gophish
```
To run as a daemon:

```bash
docker run -d --name gophish -p 3333:3333 -p 8083:80 ulissescastro/gophish
```

In your browser, go to ```http://your-docker-machine-ip:3333```

#### Building the image

```bash
git clone https://github.com/ulissescastro/docker-gophish
cd docker-gophish
docker build -t "yourname/gophish:yourtag" .
```

## Contributing

Issues and pull requests are gladly accepted!

## gophish license

gophish - Open-Source Phishing Framework
The MIT License (MIT)
Copyright (c) 2013 - 2016 Jordan Wright
