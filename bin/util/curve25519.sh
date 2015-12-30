#!/usr/bin/env bash
# Build Path: /app/.heroku/php/

install_curve25519_ext() {
	echo "-----> Building curve25519..."

	BUILD_DIR=$1
	ln -s $BUILD_DIR/.heroku /app/.heroku
	export PATH=/app/.heroku/php/bin:$PATH

	curl -L https://codeload.github.com/lt/php-curve25519-ext/tar.gz/master | tar xz
	pushd php-curve25519-ext-master/
	phpize
	./configure
	make -s -j 9
	make install -s
	popd

	echo "-----> Adding extension curve25519 to PHP."

	install_ext "curve25519" "automatic"
	exts+=("curve25519")

	echo "-----> Done."
}