FROM alpine:latest

LABEL org.opencontainers.image.title="Nerd Fonts Patcher" \
      org.opencontainers.image.description="Patches developer targeted fonts with a high number of glyphs (icons)." \
      org.opencontainers.image.url="https://www.nerdfonts.com/" \
      org.opencontainers.image.source="https://github.com/ryanoasis/nerd-fonts" \
      org.opencontainers.image.licenses="MIT"

RUN apk update && apk upgrade && apk add --no-cache fontforge parallel --repository=https://dl-cdn.alpinelinux.org/alpine/latest-stable/community

ENV PYTHONIOENCODING=utf-8

VOLUME /in /out
COPY . /nerd

ENTRYPOINT [ "/bin/sh", "/nerd/bin/scripts/docker-entrypoint.sh" ]
