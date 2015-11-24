VERSION = $(shell $(shell pwd)/acts --version | cut -d' ' -f3)

package: dist/acts_$(VERSION)_all.deb

clean:
	rm -rf dist

dist/acts_$(VERSION)_all.deb: dist
	@ fpm \
		-s dir \
		-n acts \
		-t deb \
		-p dist/ \
		--version "$(VERSION)" \
		--maintainer "Alex Jurkiewicz <alex@jurkiewi.cz>" \
		--license "public-domain" \
		--category "utils" \
		--architecture "all" \
		--url "https://github.com/alexjurkiewicz/acts" \
		-d "bsdutils" \
		-d "coreutils >= 8.21" \
		--exclude .git \
		--deb-priority "extra" \
		"acts=/usr/bin/acts"

dist:
	@ mkdir dist

.PHONY: \
	package \
	check \
	clean
