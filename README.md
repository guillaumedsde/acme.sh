# [🐋 docker-acme.sh](https://github.com/guillaumedsde/docker-acme.sh)

[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/guillaumedsde/docker-acme.sh)](https://gitlab.com/guillaumedsde/docker-acme.sh/-/pipelines)
[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/guillaumedsde/docker-acme.sh)](https://gitlab.com/guillaumedsde/docker-acme.sh/-/pipelines)
[![Website](https://img.shields.io/website?label=documentation&url=https%3A%2F%2Fguillaumedsde.gitlab.io%2Fdocker-acme.sh%2F)](https://guillaumedsde.gitlab.io/docker-acme.sh/)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/27a9ea4b0a3f4e04b3b95fcd1086471f)](https://www.codacy.com/manual/guillaumedsde/docker-acme.sh?utm_source=gitlab.com&utm_medium=referral&utm_content=guillaumedsde/docker-acme.sh&utm_campaign=Badge_Grade)
[![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/guillaumedsde/docker-acme.sh)](https://hub.docker.com/r/guillaumedsde/acme.sh)
[![Docker Pulls](https://img.shields.io/docker/pulls/guillaumedsde/docker-acme.sh)](https://hub.docker.com/r/guillaumedsde/acme.sh)
[![GitHub stars](https://img.shields.io/github/stars/guillaumedsde/docker-acme.sh?label=Github%20stars)](https://github.com/guillaumedsde/docker-acme.sh)
[![GitHub watchers](https://img.shields.io/github/watchers/guillaumedsde/docker-acme.sh?label=Github%20Watchers)](https://github.com/guillaumedsde/docker-acme.sh)
[![Docker Stars](https://img.shields.io/docker/stars/guillaumedsde/docker-acme.sh)](https://hub.docker.com/r/guillaumedsde/acme.sh)
[![GitHub](https://img.shields.io/github/license/guillaumedsde/docker-acme.sh)](https://github.com/guillaumedsde/docker-acme.sh/blob/master/LICENSE.md)

[acme.sh](https://github.com/Neilpang/acme.sh) is an ACME protocol client written in sh for automatically issuing certificates from Let's Encrypt.

This is an improved yet similarly behaving Docker image for acme.sh based on the improved image from [spritsail/acme.sh](https://github.com/spritsail/acme.sh) It should behave almost exactly the same as the "official" container, but open an issue if you think it doesn't

## ✔️ Features summary

- 🏔️ Alpine Linux small and secure base Docker image
- 🤏 As few Docker layers as possible
- 🛡️ Minimal software dependencies installed
- 🖥️ Built for many platforms

## 🏁 Run

### As a CLI

```sh
# issue a certificate
docker run \
    --user $(id -u):$(id -g) \
    --rm \
    -it \
    -v ~/certs:/acme.sh \
    guillaumedsde/acme.sh \
    --issue \
    -d example.com \
    --standalone
```

```sh
# issue a certificate using dnsapi
docker run \
    --user $(id -u):$(id -g) \
    --rm \
    -it \
    -v ~/certs:/acme.sh \
    -e CF_Email=user@example.tld \
    guillaumedsde/acme.sh \
    --issue \
    -d example.com \
    --dns dns_cf
```

### As a daemon

```sh
# start the daemon
docker run \
    --user $(id -u):$(id -g) \
    --rm \
    -it \
    -v ~/certs:/acme.sh \
    guillaumedsde/acme.sh \
    daemon
```

## 🖥️ Supported architectures

This container is built for many hardware architectures (yes, even ppc64le whoever uses that... 😉):

- linux/386
- linux/amd64
- linux/arm/v6
- linux/arm/v7
- linux/arm64
- linux/ppc64le

All you have to do is use a recent version of docker and it will pull the appropriate version of the image [guillaumedsde/docker-acme.sh](https://hub.docker.com/repository/docker/guillaumedsde/acme.sh) from the docker hub.

## 🙏 Credits

A couple of projects really helped me out while developing this container:

- 💽 [acme.sh](https://github.com/Neilpang/acme.sh) _the_ awesome software
- 💽 [spritsail/acme.sh](https://github.com/spritsail/acme.sh) a much needed improvement to the base acme.sh image
- 🏔️ [Alpine Linux](https://alpinelinux.org/) an awesome lightweight secure linux distribution used as the base for this container
- 🐋 The [Docker](https://github.com/docker) project (of course)
