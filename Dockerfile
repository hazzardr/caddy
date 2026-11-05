FROM docker.io/library/caddy:2.11.8-builder@sha256:212168c3a069fb6a18ced9e817f974c8a5ef21a41d305bcdb66ec0bd416079ef AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-l4

FROM docker.io/library/caddy:2.11.8@sha256:f04f1e8d78da0c65ec6f81b4ea8d216849775f3bc3c87790d95fcb2ec3722f12

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
