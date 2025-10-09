FROM docker.io/library/caddy:2.10.2-builder@sha256:4d2be51cdd15fc6872738bc1f26f7c0606c8bd135e7580d4fe6cf54810b19bb7 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM docker.io/library/caddy:2.10.2@sha256:3f372402fa8af139e4066b47af07e805748c2aedcee64be77e39e123de76d168

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
