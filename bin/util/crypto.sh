#!/usr/bin/env bash

pushd () {
    command pushd "$@" > /dev/null
}

popd () {
    command popd "$@" > /dev/null
}

install_crypto_ext() {
    echo " "
    echo "-----> Building crypto..."

    curl --silent -L https://codeload.github.com/bukka/php-crypto/tar.gz/master | tar xz
    curl --silent -L https://codeload.github.com/bukka/phpc/tar.gz/a9df7aeb092cced3df68794d453c6c1b360b5f68 | tar xz
    cp phpc-a9df7aeb092cced3df68794d453c6c1b360b5f68/* php-crypto-master/phpc/
    pushd php-crypto-master/
    phpize >/dev/null
    ./configure --with-crypto >/dev/null
    make -j 9 --silent >/dev/null
    make install --silent >/dev/null
    popd

    install_ext "crypto" "automatic"
    exts+=("crypto")

    echo "       Done"
}

