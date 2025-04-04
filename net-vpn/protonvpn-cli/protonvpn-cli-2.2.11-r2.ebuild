# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1

DESCRIPTION="A VPN command-line tool from protonvpn - python rewrite"
HOMEPAGE="https://protonvpn.com https://github.com/ProtonVPN/protonvpn-cli-ng"
SRC_URI="https://github.com/ProtonVPN/linux-cli-community/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~riscv"

RDEPEND="
	dev-python/docopt[${PYTHON_USEDEP}]
	dev-python/distro[${PYTHON_USEDEP}]
	dev-python/pythondialog:0[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	net-vpn/openvpn
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/linux-cli-community-${PV}"

DOCS=( CHANGELOG.md README.md USAGE.md )
