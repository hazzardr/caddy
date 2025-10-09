FROM docker.io/library/caddy:2.10.2-builder@sha256:5ffdd1eb7c262d118977dfd8c4a0c34c7781366fbadef3b4daeac459cb30e99e AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM docker.io/library/caddy:2.10.2@sha256:3f372402fa8af139e4066b47af07e805748c2aedcee64be77e39e123de76d168

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
