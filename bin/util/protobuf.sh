#!/usr/bin/env bash
# Build Path: /app/.heroku/php/

OUT_PREFIX=$1

# fail hard
set -o pipefail
# fail harder
set -eu

echo "-----> Building protobuf..."

curl -L https://codeload.github.com/allegro/php-protobuf/tar.gz/master | tar xz
pushd php-protobuf-master/
phpize
./configure --prefix=${OUT_PREFIX}
make -s -j 9
make install -s
popd

echo "-----> Adding extension protobuf to PHP."

install_ext "protobuf" "automatic"
exts+=("protobuf")

echo "-----> Done."