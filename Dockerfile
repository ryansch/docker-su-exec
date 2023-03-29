FROM buildpack-deps:latest
LABEL maintainer="Ryan Schlesinger <ryan@ryanschlesinger.com>"

ENV SUEXEC_VERSION 212b75144bbc06722fbd7661f651390dc47a43d1

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN set -eux; \
      \
      mkdir -p /tmp/build; \
      cd /tmp/build; \
      \
      wget -O su-exec.tar.gz https://github.com/ncopa/su-exec/archive/${SUEXEC_VERSION}.tar.gz; \
      tar -zxf su-exec.tar.gz; \
      cd su-exec-${SUEXEC_VERSION}; \
      make PREFIX=/sbin; \
      cp su-exec /sbin/; \
      \
      cd; \
      rm -rf /tmp/build
