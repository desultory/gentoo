# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools dot-a toolchain-funcs

DESCRIPTION="Portable C library for reading and writing BSB format image files"
HOMEPAGE="https://libbsb.sourceforge.net/"
SRC_URI="https://downloads.sourceforge.net/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="media-libs/libpng
	media-libs/tiff:="
RDEPEND="${DEPEND}"

# "make check" in 0.0.7 fails with newer tiff versions (4.0.0) although the
# tools work perfectly, so restrict test until this is fixed upstream
RESTRICT="test"

src_prepare(){
	sed -i -e "s|ar crv|$(tc-getAR) crv|" Makefile.am || die
	default
	eautoreconf
}

src_configure() {
	lto-guarantee-fat
	default
}

src_install() {
	default
	strip-lto-bytecode
}
