# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools git-r3 udev

DESCRIPTION="Library to interact with PS Vita's USB MTP protocol"
HOMEPAGE="https://github.com/codestation/vitamtp"
LICENSE="GPL-3"
SLOT="0"
EGIT_REPO_URI="https://github.com/codestation/vitamtp"

DEPEND="
	virtual/libusb:1
	dev-libs/libxml2:2=
"
RDEPEND="${DEPEND}"

src_prepare() {
	rm ChangeLog || die "Failed to rm changelog" # Triggers QA warn (symlink to nowhere)

	sed -r \
		-e 's@vitamtp@usb@' \
		-i debian/libvitamtp5.udev
	# ^ ease console management for users
	# (we don't really need extra group for this)

	default
	eautoreconf
}

src_configure() {
	econf --disable-static
}

src_install() {
	default

	find "${ED}" -name '*.la' -delete || die

	udev_newrules debian/libvitamtp5.udev 10-vitamtp.rules
}

pkg_postinst() {
	udev_reload
}

pkg_postrm() {
	udev_reload
}
