# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

MY_P="${PN}-2.8"

DESCRIPTION="A cross-platform open source C and C++ SDK for SOAP/XML Web services"
HOMEPAGE="http://gsoap2.sourceforge.net"
SRC_URI="https://downloads.sourceforge.net/gsoap2/gsoap_${PV}.zip"

LICENSE="|| ( gSOAP-1.3b GPL-2+-with-openssl-exception ) GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc debug examples ipv6 gnutls +ssl"

RDEPEND="
	sys-libs/zlib
	gnutls? ( net-libs/gnutls )
	ssl? (
		dev-libs/openssl:0=
	)
"
DEPEND="${RDEPEND}
	app-arch/unzip
	app-alternatives/lex
	app-alternatives/yacc
"

PATCHES=(
	# Fix Pre-ISO headers
	"${FILESDIR}/${PN}-2.7.10-fedora-install_soapcpp2_wsdl2h_aux.patch"

	# enable shared libs https://bugs.gentoo.org/583398
	"${FILESDIR}/${PN}-2.8.91-shared_libs.patch"
)

S="${WORKDIR}/${MY_P}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	local myeconfargs=(
		# Don't include xlocale.h as it got removed in >=glibc-2.26
		--disable-xlocale
		$(use_enable debug)
		$(use_enable gnutls)
		$(usex ipv6 --enable-ipv6 '')
		$(usex ssl '' --disable-ssl)
	)
	econf "${myeconfargs[@]}"
}

src_install() {
	emake DESTDIR="${D}" install

	# yes, we also install the license-file since
	# it contains info about how to apply the licenses
	dodoc *.txt

	docinto html
	dodoc changelog.md

	find "${ED}" \( -name "*.a" -o -name "*.la" \) -delete || die

	if use examples; then
		insinto /usr/share/${PN}/examples
		doins -r gsoap/samples/*
	fi

	if use doc; then
		docinto html
		dodoc -r gsoap/doc/*
	fi
}
