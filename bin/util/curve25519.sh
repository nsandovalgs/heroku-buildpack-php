#!/usr/bin/env bash
# Build Path: /app/.heroku/php/

install_curve25519_ext() {
	echo "-----> Building curve25519..."

	curl --silent -L https://codeload.github.com/mgp25/curve25519-php/tar.gz/master | tar xz
	pushd curve25519-php-master/
	phpize
	#./configure
	./configure --enable-curve25519
	make -s -j 9
	make install -s
	popd

	echo "-----> Adding extension curve25519 to PHP."

	install_ext "curve25519" "automatic"
	exts+=("curve25519")

	echo "-----> Done."
}