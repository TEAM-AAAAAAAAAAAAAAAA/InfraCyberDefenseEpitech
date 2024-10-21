FROM coredns/coredns:1.11.3@sha256:9caabbf6238b189a65d0d6e6ac138de60d6a1c419e5a341fbbb7c78382559c6e

LABEL org.opencontainers.image.source=https://github.com/TEAM-AAAAAAAAAAAAAAAA/InfraCyberDefenseEpitech

WORKDIR /app

COPY powerzio.net.db powerzio.net.db
COPY Corefile Corefile
ENTRYPOINT [ "/coredns", "-conf", "Corefile" ]