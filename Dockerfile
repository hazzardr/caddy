FROM docker.io/library/caddy:2.9.1-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/porkbun \
    --with github.com/libdns/porkbun

FROM docker.io/library/caddy:2.9.1

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
