# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools flag-o-matic toolchain-funcs

DESCRIPTION="Packet generator tool for ethernet"
HOMEPAGE="http://packeth.sourceforge.net/"
SRC_URI="https://github.com/jemcek/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="cli +gtk"
REQUIRED_USE="
	|| ( cli gtk )
"

RDEPEND="
	gtk? (
		dev-libs/glib:2
		x11-libs/gdk-pixbuf
		x11-libs/gtk+:3
	)
"
DEPEND="
	${RDEPEND}
	gtk? ( virtual/pkgconfig )
"
PATCHES=(
	"${FILESDIR}"/${PN}-1.8.1-libs-and-flags.patch
)
DOCS=( AUTHORS CHANGELOG README )

src_prepare() {
	default
	use gtk && eautoreconf
}

src_configure() {
	# -Werror=lto-type-mismatch
	# https://bugs.gentoo.org/861695
	# https://github.com/jemcek/packETH/issues/42
	filter-lto

	use gtk && default
}

src_compile() {
	use gtk && default
	use cli && emake \
		CC="$(tc-getCC)" CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" -C cli
}

src_install() {
	use gtk && default

	if use cli; then
		dobin cli/${PN}cli
		local i
		for i in NEWS README TODO; do newdoc cli/${i} ${i}.cli; done
	fi
}
