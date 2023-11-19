# Copyright 2023-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.10

EAPI=8

CRATES="
	addr2line@0.20.0
	adler@1.0.2
	ahash@0.8.5
	aho-corasick@0.7.20
	aho-corasick@1.0.2
	allocator-api2@0.2.14
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anyhow@1.0.75
	arc-swap@1.6.0
	autocfg@1.1.0
	backtrace@0.3.68
	bitflags@1.3.2
	bitflags@2.4.1
	bstr@1.6.0
	btoi@0.4.3
	bumpalo@3.12.0
	bytecount@0.6.3
	bytes@1.4.0
	cassowary@0.3.0
	cc@1.0.83
	cfg-if@1.0.0
	chardetng@0.1.17
	chrono@0.4.31
	clipboard-win@4.5.0
	clru@0.6.1
	codespan-reporting@0.11.1
	content_inspector@0.2.4
	core-foundation-sys@0.8.4
	cov-mark@1.1.0
	crc32fast@1.3.2
	crossbeam-channel@0.5.8
	crossbeam-deque@0.8.3
	crossbeam-epoch@0.9.15
	crossbeam-utils@0.8.16
	crossterm@0.27.0
	crossterm_winapi@0.9.1
	cxx-build@1.0.94
	cxx@1.0.94
	cxxbridge-flags@1.0.94
	cxxbridge-macro@1.0.94
	dirs-sys@0.4.1
	dirs@5.0.1
	dunce@1.0.4
	either@1.8.1
	encoding_rs@0.8.33
	encoding_rs_io@0.1.7
	equivalent@1.0.0
	errno-dragonfly@0.1.2
	errno@0.3.1
	error-code@2.3.1
	etcetera@0.8.0
	faster-hex@0.8.1
	fastrand@2.0.0
	fern@0.6.2
	filedescriptor@0.8.2
	flate2@1.0.27
	fnv@1.0.7
	form_urlencoded@1.2.0
	futures-core@0.3.28
	futures-executor@0.3.28
	futures-task@0.3.28
	futures-util@0.3.28
	getrandom@0.2.9
	gimli@0.27.3
	gix-actor@0.28.0
	gix-chunk@0.4.4
	gix-commitgraph@0.22.0
	gix-config-value@0.14.0
	gix-config@0.31.0
	gix-date@0.8.0
	gix-diff@0.37.0
	gix-discover@0.26.0
	gix-features@0.36.0
	gix-fs@0.8.0
	gix-glob@0.14.0
	gix-hash@0.13.1
	gix-hashtable@0.4.0
	gix-lock@11.0.0
	gix-macros@0.1.0
	gix-object@0.38.0
	gix-odb@0.54.0
	gix-pack@0.44.0
	gix-path@0.10.0
	gix-quote@0.4.7
	gix-ref@0.38.0
	gix-refspec@0.19.0
	gix-revision@0.23.0
	gix-revwalk@0.9.0
	gix-sec@0.10.0
	gix-tempfile@11.0.0
	gix-trace@0.1.3
	gix-traverse@0.34.0
	gix-url@0.25.1
	gix-utils@0.1.5
	gix-validate@0.8.0
	gix@0.55.2
	globset@0.4.13
	grep-matcher@0.1.6
	grep-regex@0.1.11
	grep-searcher@0.1.11
	hashbrown@0.12.3
	hashbrown@0.14.2
	hermit-abi@0.2.6
	home@0.5.4
	iana-time-zone-haiku@0.1.1
	iana-time-zone@0.1.56
	idna@0.4.0
	ignore@0.4.20
	imara-diff@0.1.5
	indexmap@2.0.0
	indoc@2.0.4
	itoa@1.0.6
	js-sys@0.3.61
	lazy_static@1.4.0
	libc@0.2.149
	libloading@0.8.1
	link-cplusplus@1.0.8
	linux-raw-sys@0.4.10
	lock_api@0.4.9
	log@0.4.20
	lsp-types@0.94.1
	memchr@2.6.3
	memmap2@0.5.10
	memmap2@0.7.1
	memoffset@0.9.0
	miniz_oxide@0.7.1
	mio@0.8.6
	nucleo-matcher@0.2.0
	nucleo@0.2.1
	num-traits@0.2.15
	num_cpus@1.15.0
	num_threads@0.1.6
	object@0.31.1
	once_cell@1.18.0
	option-ext@0.2.0
	parking_lot@0.12.1
	parking_lot_core@0.9.7
	percent-encoding@2.3.0
	pin-project-lite@0.2.12
	pin-utils@0.1.0
	proc-macro2@1.0.69
	prodash@26.2.2
	pulldown-cmark@0.9.3
	quickcheck@1.0.3
	quote@1.0.29
	rand@0.8.5
	rand_core@0.6.4
	rayon-core@1.11.0
	rayon@1.7.0
	redox_syscall@0.2.16
	redox_syscall@0.3.5
	redox_users@0.4.3
	regex-automata@0.3.9
	regex-automata@0.4.3
	regex-syntax@0.6.29
	regex-syntax@0.8.2
	regex@1.10.2
	ropey@1.6.1
	rustc-demangle@0.1.23
	rustix@0.38.20
	ryu@1.0.13
	same-file@1.0.6
	scopeguard@1.1.0
	scratch@1.0.5
	serde@1.0.189
	serde_derive@1.0.189
	serde_json@1.0.107
	serde_repr@0.1.12
	serde_spanned@0.6.3
	sha1_smol@1.0.0
	signal-hook-mio@0.2.3
	signal-hook-registry@1.4.1
	signal-hook-tokio@0.3.1
	signal-hook@0.3.17
	slab@0.4.8
	slotmap@1.0.6
	smallvec@1.11.1
	smartstring@1.0.1
	smawk@0.3.1
	socket2@0.5.3
	static_assertions@1.1.0
	str-buf@1.0.6
	str_indices@0.4.1
	syn@1.0.109
	syn@2.0.38
	tempfile@3.8.0
	termcolor@1.2.0
	termini@1.0.0
	textwrap@0.16.0
	thiserror-impl@1.0.50
	thiserror@1.0.50
	thread_local@1.1.7
	threadpool@1.8.1
	time-core@0.1.1
	time-macros@0.2.10
	time@0.3.23
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tokio-macros@2.1.0
	tokio-stream@0.1.14
	tokio@1.33.0
	toml@0.7.6
	toml_datetime@0.6.3
	toml_edit@0.19.12
	tree-sitter@0.20.10
	unicase@2.6.0
	unicode-bidi@0.3.13
	unicode-bom@2.0.2
	unicode-general-category@0.6.0
	unicode-ident@1.0.8
	unicode-linebreak@0.1.5
	unicode-normalization@0.1.22
	unicode-segmentation@1.10.1
	unicode-width@0.1.11
	url@2.4.1
	version_check@0.9.4
	walkdir@2.3.3
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.84
	wasm-bindgen-macro-support@0.2.84
	wasm-bindgen-macro@0.2.84
	wasm-bindgen-shared@0.2.84
	wasm-bindgen@0.2.84
	which@4.4.1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.5
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-targets@0.42.2
	windows-targets@0.48.0
	windows@0.48.0
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.0
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.0
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.0
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.0
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.0
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.0
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.0
	winnow@0.4.6
	winnow@0.5.17
	zerocopy-derive@0.7.11
	zerocopy@0.7.11
"

inherit cargo desktop shell-completion xdg

DESCRIPTION="A post-modern text editor"
HOMEPAGE="
	https://helix-editor.com/
	https://github.com/helix-editor/helix
"
SRC_URI="
	https://github.com/helix-editor/helix/releases/download/${PV}/${P}-source.tar.xz -> ${P}.tar.xz
	${CARGO_CRATE_URIS}
"

S="${WORKDIR}"

LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD Boost-1.0 ISC MIT MPL-2.0 Unicode-DFS-2016 Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+grammar"

BDEPEND="grammar? ( dev-vcs/git )"
RDEPEND="dev-vcs/git"

QA_FLAGS_IGNORED="
	usr/bin/hx
	usr/share/helix/runtime/grammars/.*\.so
"

DOCS=(
	README.md
	CHANGELOG.md
	book/
	docs/
)

src_compile() {
	use grammar || local -x HELIX_DISABLE_AUTO_GRAMMAR_BUILD=1

	cargo_src_compile
}

src_install() {
	cargo_src_install --path helix-term

	rm -r runtime/grammars/.gitkeep || die
	rm -r runtime/grammars/sources || die

	insinto /usr/share/helix
	doins -r runtime

	dodoc -r "${DOCS[@]}"

	doicon -s 256x256 contrib/${PN}.png
	domenu contrib/Helix.desktop

	insinto /usr/share/metainfo
	doins contrib/Helix.appdata.xml

	newbashcomp contrib/completion/hx.bash hx
	newzshcomp contrib/completion/hx.zsh _hx
	dofishcomp contrib/completion/hx.fish

	newenvd - 99helix <<< 'HELIX_RUNTIME="/usr/share/helix/runtime"'
}

pkg_postinst() {
	einfo "The runtime files (grammars, queries, themes) have been"
	einfo "installed in '/usr/share/helix/runtime'. The environment variable"
	einfo "HELIX_RUNTIME was also installed on your system. In running shell instances"
	einfo "you need to run 'source /etc/profile' to pick up the new variable"
	einfo "or manually set the environment variable HELIX_RUNTIME=/usr/share/helix/runtime."
}
