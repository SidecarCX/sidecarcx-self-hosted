FROM postgres:17.2-bookworm

LABEL maintainer="support@sidecarcx.com"

RUN apt-get update \
    && apt-get install -y --no-install-recommends postgresql-17-pgvector \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && echo "version=0.8.0"