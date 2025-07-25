# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( lua5-1 )

inherit autotools desktop flag-o-matic lua-single

MY_P=${P/lives}

DESCRIPTION="Console-style role playing game"
HOMEPAGE="https://kqlives.sourceforge.net/"
SRC_URI="https://downloads.sourceforge.net/${PN}/${MY_P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cheats nls"

REQUIRED_USE="${LUA_REQUIRED_USE}"

RDEPEND="
	${LUA_DEPS}
	>=gnome-base/libglade-2.4
	media-libs/allegro:0
	>=media-libs/dumb-2.0.3[allegro]
	>=x11-libs/gtk+-2.8:2
	nls? ( virtual/libintl )"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	nls? ( sys-devel/gettext )"

S=${WORKDIR}/${MY_P}

PATCHES=(
	"${FILESDIR}/${P}_autoconf.patch"	# Fix #597790
	"${FILESDIR}/${P}_dumb2.patch"		# >=media-libs/dumb-2.0.3 support
	"${FILESDIR}/${P}_gcc10.patch"		# Fix #661422
)

src_prepare() {
	default
	mv debian/{kq,${PN}}.6 || die
	eautoreconf
}

src_configure() {
	# -Werror=lto-type-mismatch
	# https://bugs.gentoo.org/946320
	#
	# dead since 2011
	filter-lto

	econf \
		$(use_enable cheats) \
		$(use_enable nls)
}

src_install() {
	default
	doicon "${FILESDIR}"/${PN}.xpm
	make_desktop_entry ${PN} KqLives ${PN}
}
