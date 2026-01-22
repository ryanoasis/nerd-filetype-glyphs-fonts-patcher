FROM alpine:latest

LABEL org.opencontainers.image.title="Nerd Fonts Patcher" \
      org.opencontainers.image.description="Patches developer targeted fonts with a high number of glyphs (icons)." \
      org.opencontainers.image.url="https://www.nerdfonts.com/" \
      org.opencontainers.image.source="https://github.com/ryanoasis/nerd-fonts" \
      org.opencontainers.image.licenses="MIT"

RUN <<ENDOFRUN
apk update
apk upgrade
echo "Add build dependencies"
apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/latest-stable/community \
  alpine-sdk \
  cmake \
  coreutils \
  freetype-dev \
  gettext-dev \
  harfbuzz-dev \
  libxml2-dev \
  ninja \
  python3-dev \
  woff2-dev
echo "Add execute dependencies"
apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/latest-stable/community \
  freetype \
  harfbuzz \
  libxml2 \
  python3 \
  woff2
echo "Fetch and build fontforge"
git clone https://github.com/fontforge/fontforge.git
cd fontforge
git checkout 3a960a4d83c65b8ff5fc0bab8b1f19964aa023df
mkdir build
cd build
cmake -GNinja \
  -DENABLE_GUI=off \
  -DENABLE_DOCS=off \
  -DENABLE_NATIVE_SCRIPTING=off \
  -DENABLE_LIBSPIRO=off \
  -DENABLE_PYTHON_EXTENSION=off \
  ..
ninja
cmake --install . --strip
cd ../..
rm -rf fontforge
rm -rf /usr/local/share
echo "Remove build dependencies"
apk del --rdepends \
  alpine-sdk \
  cmake \
  coreutils \
  freetype-dev \
  gettext-dev \
  harfbuzz-dev \
  libxml2-dev \
  ninja \
  python3-dev \
  tiff-dev \
  woff2-dev
echo "Add additional runtime dependencies"
apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/latest-stable/community \
  parallel
ENDOFRUN

ENV PYTHONIOENCODING=utf-8

VOLUME /in /out
COPY . /nerd

ENTRYPOINT [ "/bin/sh", "/nerd/bin/scripts/docker-entrypoint.sh" ]
