# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

MY_PN="wqy-bitmapsong"

DESCRIPTION="WenQuanYi Bitmap Song CJK font"
HOMEPAGE="http://wenq.org/wqy2/index.cgi?Home"
SRC_URI="https://downloads.sourceforge.net/wqy/${MY_PN}-pcf-${PV/_rc/-RC}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 arm ~hppa ~loong ppc ~riscv ~s390 sparc x86"
IUSE=""
# Only installs fonts
RESTRICT="strip binchecks"

S="${WORKDIR}/${MY_PN}"

FONT_S="${S}"
FONT_SUFFIX="pcf"
FONT_CONF=( "85-wqy-bitmapsong.conf" )
