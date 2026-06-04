FROM docker.io/library/caddy:2.11.4-builder@sha256:08aab4980494ed7ed38d0249705d6f39b482c3373b578af7494168d19df62411 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM docker.io/library/caddy:2.11.4@sha256:cb9d71ad83182011b79355cd57692686374bd78d6fe327efe0ff8507da03ab13

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
