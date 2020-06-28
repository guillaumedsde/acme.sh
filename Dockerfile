FROM alpine:latest

ARG VERSION=master

ENV LE_WORKING_DIR=/acme.sh \
    _SCRIPT_HOME=/opt/acme.sh

WORKDIR $_SCRIPT_HOME

RUN apk --no-cache add -f \
    openssl \
    coreutils \
    bind-tools \
    curl \
    socat \
    tini \
    && \
    curl -sSL https://github.com/Neilpang/acme.sh/archive/${VERSION}.tar.gz | tar xz --strip-components=1 && \
    chmod 755 ./acme.sh && \
    rm -rf .github .travis.yml Dockerfile README.md && \
    ln -sfv /opt/acme.sh/acme.sh /usr/local/bin

VOLUME /acme.sh
WORKDIR /acme.sh

SHELL ["/bin/sh", "-c"]

LABEL org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="acme.sh" \
    org.label-schema.description="acme.sh docker container on alpine linux" \
    org.label-schema.url="https://guillaumedsde.gitlab.io/docker-acme.sh/" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.version=$VERSION \
    org.label-schema.vcs-url="https://github.com/guillaumedsde/docker-acme.sh" \
    org.label-schema.vendor="guillaumedsde" \
    org.label-schema.schema-version="1.0"

ENTRYPOINT \
    set -- "$0" "$@"; \
    if [ "$1" = "daemon" ]; then \
    # insert a crontab entry to run every hour, starting an hour from now
    echo "$(( $(date +%-M -d 'now') + 1 )) 0 * * * acme.sh --cron" | tee /dev/stderr | crontab -; \
    exec tini -- crond -f -d6; \
    else \
    exec -- acme.sh "$@"; \
    fi

CMD ["--help"]
