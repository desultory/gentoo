# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=WYANT
DIST_VERSION=0.089
DIST_EXAMPLES=("eg/*")
inherit perl-module

DESCRIPTION="Represent a regular expression of some sort"

SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~loong ~mips ppc ppc64 ~riscv ~sparc x86 ~amd64-linux ~x86-linux ~ppc-macos"

RDEPEND="
	dev-perl/List-MoreUtils
	>=dev-perl/PPI-1.238.0
	dev-perl/Task-Weaken
"
BDEPEND="
	${RDEPEND}
	>=dev-perl/Module-Build-0.420.0
	test? ( >=virtual/perl-Test-Simple-0.880.0 )
"
