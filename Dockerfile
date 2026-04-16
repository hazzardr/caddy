FROM docker.io/library/caddy:2.11.2-builder@sha256:5af59f1fa4f93a8945384cdd657ef879cac5034142bf2be9c489e2a570884673 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM docker.io/library/caddy:2.11.2@sha256:22e1d921a7dd98ea722ebd6819de785fd71abdab7f7fed8a2378e96d29bb923a

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
