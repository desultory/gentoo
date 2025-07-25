# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit dune

DESCRIPTION="Computer-Aided Cryptographic Proofs"
HOMEPAGE="https://github.com/EasyCrypt/easycrypt/"

if [[ "${PV}" == *9999* ]] ; then
	inherit git-r3

	EGIT_REPO_URI="https://github.com/EasyCrypt/${PN}"
else
	SRC_URI="https://github.com/EasyCrypt/${PN}/archive/r${PV}.tar.gz
		-> ${P}.gh.tar.gz"
	S="${WORKDIR}/${PN}-r${PV}"

	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0/${PV}"
IUSE="+ocamlopt"

RDEPEND="
	>=dev-lang/ocaml-4.08.0:=[ocamlopt?]
	>=sci-mathematics/why3-1.8.0:=

	dev-ml/batteries:=
	dev-ml/camlp-streams:=
	dev-ml/camlzip:=
	dev-ml/dune-build-info:=
	dev-ml/dune-site:=
	dev-ml/num:=
	dev-ml/ocaml-inifiles:=
	dev-ml/pcre-ocaml:=
	dev-ml/yojson:=
	dev-ml/zarith:=
"
DEPEND="
	${RDEPEND}
"

src_prepare() {
	local theories="[\"$(ocamlc -where)/easycrypt/theories\"]"
	sed -i "s|EcRelocate\.Sites\.theories|${theories}|g" src/ec.ml || die

	default
}
