FROM tccr.io/truecharts/alpine:v3.18.4@sha256:17cd77e25d3fa829d168caec4db7bb5b52ceeb935d8ca0d1180de6f615553dc4

ARG VERSION
ARG CHANNEL

USER root

ENV XDG_CONFIG_HOME=/config

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
# hadolint ignore=DL3018
RUN \
    apk update --no-cache \
    && apk add --no-cache \
        sqlite-libs \
        gcompat \
        icu-libs \
        krb5-libs \
        libgcc \
        libintl \
        libssl1.1 \
        libstdc++ \
        zlib \
    && wget -qO  - "https://github.com/Jackett/Jackett/releases/download/v${VERSION}/Jackett.Binaries.LinuxAMDx64.tar.gz" \
        | tar xzf - -C /app --strip-components 1 \
    && rm -rf  \
      /tmp/* \
      /var/cache/apk/* \
      /var/tmp/ \
      /app/JackettUpdater* \
    && chown -R root:root /app \
    && chmod -R 775 /app \
    && ls -l /app \
    && printf "umask %d" "${UMASK}" >> /etc/bash.bashrc

USER apps

EXPOSE 9117

COPY ./apps/jackett/entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]

LABEL "org.opencontainers.image.source"="https://github.com/truecharts/apps"

ARG CONTAINER_NAME
ARG CONTAINER_VER
LABEL org.opencontainers.image.title="${CONTAINER_NAME}"
LABEL org.opencontainers.image.url="https://truecharts.org/docs/charts/${CONTAINER_NAME}"
LABEL org.opencontainers.image.version="${CONTAINER_VER}"
LABEL org.opencontainers.image.description="Container for ${CONTAINER_NAME} by TrueCharts"
LABEL org.opencontainers.image.documentation="https://truecharts.org/docs/charts/${CONTAINER_NAME}"
