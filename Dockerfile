FROM docker.io/library/caddy:2.11.8-builder@sha256:212168c3a069fb6a18ced9e817f974c8a5ef21a41d305bcdb66ec0bd416079ef AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-l4

FROM docker.io/library/caddy:2.11.8@sha256:4fcafa98afd1c2e642e353e3c5cf9ddbe892fcee14bc990e7ba2c5b78e51f9cf

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
