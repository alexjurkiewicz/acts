VERSION = `$${PWD}/acts --version | awk '{print $$3}'`

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
		-d "coreutils >= 8.13" \
		--exclude .git \
		--deb-priority "extra" \
		--config-files "/etc/acts.conf" \
		--deb-no-default-config-files \
		"acts=/usr/bin/acts" \
		"acts.conf.sample=/etc/acts.conf" \
		"README.md=/usr/share/docs/acts/README.md" \
		"contrib/=/usr/share/doc/acts/contrib/"

dist:
	@ mkdir dist

check:
	type shellcheck > /dev/null && shellcheck -e SC1091 acts
	type shellcheck > /dev/null && shellcheck -e SC2034 acts.conf.sample
	type shfmt > /dev/null && shfmt -i 4 -d acts
	type shfmt > /dev/null && shfmt -i 4 -d acts.conf.sample

.PHONY: \
	check \
	clean \
	package
