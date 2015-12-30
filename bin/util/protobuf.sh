#!/usr/bin/env bash

pushd () {
    command pushd "$@" > /dev/null
}

popd () {
    command popd "$@" > /dev/null
}

install_protobuf_ext() {
    echo "-----> Building protobuf..."

    curl --silent -L https://codeload.github.com/allegro/php-protobuf/tar.gz/master | tar xz
    pushd php-protobuf-master/
    phpize
    #./configure
    ./configure --enable-protobuf
    make -s -j 9
    make install -s
    popd

    echo "-----> Adding extension protobuf to PHP."

    install_ext "protobuf" "automatic"
    exts+=("protobuf")

    echo "-----> Done."
}

