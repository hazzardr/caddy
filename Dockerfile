FROM docker.io/library/caddy:2.11.4-builder@sha256:2620ea2bb3ba2119a51dee02753f2e16e7f0a33dca5466e240e2d32f1df90a5b AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-l4

FROM docker.io/library/caddy:2.11.4@sha256:df7f1c2fb114453b951de51a98efc010db1655a92c2e86be6706714e2417a78d

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
