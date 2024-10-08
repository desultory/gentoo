# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="Provides an opaque interface to the display's acceleration function"
HOMEPAGE="https://ibiblio.org/ggicore/packages/libggi.html"
SRC_URI="https://downloads.sourceforge.net/ggi/${P}.src.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 arm ~arm64 ~hppa ~loong ppc ppc64 ~riscv ~s390 sparc x86"
IUSE="3dfx aalib cpu_flags_x86_mmx debug fbcon svga vis X"

RDEPEND=">=media-libs/libgii-1.0.2
	aalib? ( >=media-libs/aalib-1.2-r1 )
	svga? ( >=media-libs/svgalib-1.4.2 )
	X? (
		x11-libs/libXt
		x11-libs/libXxf86dga
		x11-libs/libXxf86vm
	)"
DEPEND="${RDEPEND}
	X? ( x11-base/xorg-proto )"

DOCS=( ChangeLog ChangeLog.1999 FAQ NEWS README )

PATCHES=(
	"${FILESDIR}/${P}-slibtool.patch" # 775584
	"${FILESDIR}/${P}-incompatible-types.patch" # 880931
)

src_prepare() {
	default

	# We really don't want this
	# https://sourceforge.net/p/ggi/patches/7/
	rm -f acinclude.m4 || die

	eautoreconf
}

src_configure() {
	local myconf=""

	use svga || myconf="${myconf} --disable-svga --disable-vgagl"

	if use amd64 || use ppc64 ; then
		myconf="${myconf} --enable-64bitc"
	else
		myconf="${myconf} --disable-64bitc"
	fi

	econf $(use_enable 3dfx glide) \
		$(use_enable aalib aa) \
		$(use_enable debug) \
		$(use_enable cpu_flags_x86_mmx mmx) \
		$(use_enable vis) \
		$(use_with X x) \
		$(use_enable X x) \
		$(use_enable fbcon fbdev) \
		--disable-directfb \
		--disable-static \
		${myconf}
}

src_install() {
	default

	docinto txt
	dodoc doc/*.txt

	find "${D}" -name '*.la' -delete || die
}
