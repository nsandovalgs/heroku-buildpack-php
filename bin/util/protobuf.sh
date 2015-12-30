#!/usr/bin/env bash
# Build Path: /app/.heroku/php/

install_protobuf_ext() {
    echo "-----> Building protobuf..."

    curl -L https://codeload.github.com/allegro/php-protobuf/tar.gz/master | tar xz
    pushd php-protobuf-master/
    phpize
    ./configure
    make -s -j 9
    make install -s
    popd

    echo "-----> Adding extension protobuf to PHP."

    install_ext "protobuf" "automatic"
    exts+=("protobuf")

    echo "-----> Done."
}

