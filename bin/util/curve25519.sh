#!/bin/bash
# Build Path: /app/.heroku/php/

OUT_PREFIX=$1

# fail hard
set -o pipefail
# fail harder
set -eux

echo "-----> Building curve25519..."

curl -L https://codeload.github.com/lt/php-curve25519-ext/tar.gz/master | tar xz
pushd php-curve25519-ext-master/
phpize
./configure --prefix=${OUT_PREFIX}
make -s -j 9
make install -s
popd

echo "-----> Done."
