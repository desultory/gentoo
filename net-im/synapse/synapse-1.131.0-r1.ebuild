# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..13} )

CRATES="
	aho-corasick@1.1.3
	anyhow@1.0.98
	arc-swap@1.7.1
	autocfg@1.3.0
	base64@0.21.7
	bitflags@2.8.0
	blake2@0.10.6
	block-buffer@0.10.4
	bumpalo@3.16.0
	bytes@1.10.1
	cfg-if@1.0.0
	cpufeatures@0.2.12
	crypto-common@0.1.6
	digest@0.10.7
	fnv@1.0.7
	generic-array@0.14.7
	getrandom@0.3.1
	headers-core@0.3.0
	headers@0.4.0
	heck@0.5.0
	hex@0.4.3
	http@1.3.1
	httpdate@1.0.3
	indoc@2.0.5
	itoa@1.0.11
	js-sys@0.3.69
	lazy_static@1.5.0
	libc@0.2.154
	log@0.4.27
	memchr@2.7.2
	memoffset@0.9.1
	mime@0.3.17
	once_cell@1.19.0
	portable-atomic@1.6.0
	ppv-lite86@0.2.17
	proc-macro2@1.0.89
	pyo3-build-config@0.24.2
	pyo3-ffi@0.24.2
	pyo3-log@0.12.4
	pyo3-macros-backend@0.24.2
	pyo3-macros@0.24.2
	pyo3@0.24.2
	pythonize@0.24.0
	quote@1.0.36
	rand@0.9.0
	rand_chacha@0.9.0
	rand_core@0.9.0
	regex-automata@0.4.8
	regex-syntax@0.8.5
	regex@1.11.1
	ryu@1.0.18
	serde@1.0.219
	serde_derive@1.0.219
	serde_json@1.0.140
	sha1@0.10.6
	sha2@0.10.9
	subtle@2.5.0
	syn@2.0.85
	target-lexicon@0.13.2
	typenum@1.17.0
	ulid@1.2.1
	unicode-ident@1.0.12
	unindent@0.2.3
	version_check@0.9.4
	wasi@0.13.3+wasi-0.2.2
	wasm-bindgen-backend@0.2.92
	wasm-bindgen-macro-support@0.2.92
	wasm-bindgen-macro@0.2.92
	wasm-bindgen-shared@0.2.92
	wasm-bindgen@0.2.92
	web-time@1.1.0
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.52.6
	wit-bindgen-rt@0.33.0
	zerocopy-derive@0.8.17
	zerocopy@0.8.17
"

inherit cargo distutils-r1 multiprocessing optfeature systemd

DESCRIPTION="Reference implementation of Matrix homeserver"
HOMEPAGE="
	https://matrix.org/
	https://github.com/element-hq/synapse
"
SRC_URI="
	https://github.com/element-hq/${PN}/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="AGPL-3+"
# Dependent crate licenses
LICENSE+="
	Apache-2.0-with-LLVM-exceptions BSD MIT Unicode-DFS-2016
	|| ( Apache-2.0 Boost-1.0 )
"
SLOT="0"
KEYWORDS="amd64 ~arm64 ~ppc64"
IUSE="postgres selinux systemd test"
RESTRICT="!test? ( test )"

# <twisted-25: https://github.com/element-hq/synapse/issues/18565
RDEPEND="
	acct-user/synapse
	acct-group/synapse
	dev-python/attrs[${PYTHON_USEDEP}]
	dev-python/bcrypt[${PYTHON_USEDEP}]
	dev-python/bleach[${PYTHON_USEDEP}]
	>=dev-python/canonicaljson-2[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/ijson[${PYTHON_USEDEP}]
	dev-python/immutabledict[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.0[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]
	>=dev-python/matrix-common-1.3.0[${PYTHON_USEDEP}]
	dev-python/msgpack[${PYTHON_USEDEP}]
	dev-python/netaddr[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/phonenumbers[${PYTHON_USEDEP}]
	>=dev-python/pillow-10.0.1[${PYTHON_USEDEP},webp]
	dev-python/prometheus-client[${PYTHON_USEDEP}]
	dev-python/pyasn1-modules[${PYTHON_USEDEP}]
	dev-python/pyasn1[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/pymacaroons[${PYTHON_USEDEP}]
	dev-python/pyopenssl[${PYTHON_USEDEP}]
	>=dev-python/python-multipart-0.0.12-r100[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/service-identity[${PYTHON_USEDEP}]
	dev-python/signedjson[${PYTHON_USEDEP}]
	dev-python/sortedcontainers[${PYTHON_USEDEP}]
	dev-python/treq[${PYTHON_USEDEP}]
	<dev-python/twisted-25[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	dev-python/unpaddedbase64[${PYTHON_USEDEP}]
	postgres? ( dev-python/psycopg:2[${PYTHON_USEDEP}] )
	selinux? ( sec-policy/selinux-matrixd )
	systemd? ( dev-python/python-systemd[${PYTHON_USEDEP}] )
"
BDEPEND="
	acct-user/synapse
	acct-group/synapse
	dev-python/setuptools-rust[${PYTHON_USEDEP}]
	test? (
		${RDEPEND}
		dev-python/hiredis[${PYTHON_USEDEP}]
		dev-python/idna[${PYTHON_USEDEP}]
		dev-python/parameterized[${PYTHON_USEDEP}]
		dev-python/pyicu[${PYTHON_USEDEP}]
		dev-python/txredisapi[${PYTHON_USEDEP}]
		postgres? ( dev-db/postgresql[server] )
	)
"

# Rust extension
QA_FLAGS_IGNORED="usr/lib/python3.*/site-packages/synapse/synapse_rust.abi3.so"

PATCHES=(
	"${FILESDIR}/${PN}-1.123.0-skip-recovery-test.patch"
)

src_test() {
	if use postgres; then
		einfo "Preparing postgres test instance"
		initdb --pgdata="${T}/pgsql" || die
		pg_ctl --wait --pgdata="${T}/pgsql" start \
			--options="-h '' -k '${T}'" || die
		createdb --host="${T}" synapse_test || die

		# See https://matrix-org.github.io/synapse/latest/development/contributing_guide.html#running-tests-under-postgresql
		local -x SYNAPSE_POSTGRES=1
		local -x SYNAPSE_POSTGRES_HOST="${T}"
	fi

	# This remove is necessary otherwise python is not able to locate
	# synapse_rust.abi3.so.
	rm -rf synapse || die

	nonfatal distutils-r1_src_test
	local ret=${?}

	if use postgres; then
		einfo "Stopping postgres test instance"
		pg_ctl --wait --pgdata="${T}/pgsql" stop || die
	fi

	[[ ${ret} -ne 0 ]] && die
}

python_test() {
	"${EPYTHON}" -m twisted.trial -j "$(makeopts_jobs)" tests
}

src_install() {
	distutils-r1_src_install
	keepdir /var/{lib,log}/synapse /etc/synapse
	fowners synapse:synapse /var/{lib,log}/synapse /etc/synapse
	fperms 0750 /var/{lib,log}/synapse /etc/synapse
	newinitd "${FILESDIR}/${PN}.initd-r1" "${PN}"
	systemd_dounit "${FILESDIR}/synapse.service"
}

pkg_postinst() {
	optfeature "Improve user search for international display names" dev-python/pyicu
	optfeature "Redis support" dev-python/txredisapi
	optfeature "VoIP relaying on your homeserver with turn" net-im/coturn

	if [[ -z "${REPLACING_VERSIONS}" ]]; then
		einfo
		elog "In order to generate initial configuration run:"
		elog "sudo -u synapse synapse_homeserver \\"
		elog "    --server-name matrix.domain.tld \\"
		elog "    --config-path /etc/synapse/homeserver.yaml \\"
		elog "    --generate-config \\"
		elog "    --data-directory /var/lib/synapse \\"
		elog "    --report-stats=no"
		einfo
	else
		einfo
		elog "Please refer to upgrade notes if any special steps are required"
		elog "to upgrade from the version you currently have installed:"
		elog
		elog "  https://github.com/element-hq/synapse/blob/develop/docs/upgrade.md"
		einfo
	fi
}
