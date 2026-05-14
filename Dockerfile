FROM docker.io/library/caddy:2.11.3-builder@sha256:090dbc9541137fc6caac753baf94491d9998d7a04a3facb057dbfe8ddef8739a AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM docker.io/library/caddy:2.11.3@sha256:ec18ee54aab3315c22e25f3b2babda73ff8007d39b13b3bd1bfffa2f0444c7d9

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
