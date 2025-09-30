FROM postgres:18.0-bookworm

LABEL maintainer="support@sidecarcx.com"

RUN apt-get update \
    && apt-get install -y --no-install-recommends postgresql-18-pgvector \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && echo "version=0.8.1"