# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: ruby-single.eclass
# @MAINTAINER:
# Ruby team <ruby@gentoo.org>
# @AUTHOR:
# Author: Hans de Graaff <graaff@gentoo.org>
# Based on python-single-r1 by: Michał Górny <mgorny@gentoo.org>
# @SUPPORTED_EAPIS: 7 8
# @PROVIDES: ruby-utils
# @BLURB: An eclass for Ruby packages not installed for multiple implementations.
# @DESCRIPTION:
# An eclass for packages which don't support being installed for
# multiple Ruby implementations. This mostly includes ruby-based
# scripts. Set USE_RUBY to include all the ruby targets that have been
# verified to work and include the eclass. RUBY_DEPS is now available to
# pull in the dependency on the requested ruby targets.
#
# @CODE
# USE_RUBY="ruby27 ruby30"
# inherit ruby-single
# RDEPEND="${RUBY_DEPS}"
# @CODE

case ${EAPI} in
	7|8) ;;
	*) die "${ECLASS}: EAPI ${EAPI:-0} not supported" ;;
esac

if [[ -z ${_RUBY_SINGLE_ECLASS} ]]; then
_RUBY_SINGLE_ECLASS=1

inherit ruby-utils

# @ECLASS_VARIABLE: USE_RUBY
# @DEFAULT_UNSET
# @PRE_INHERIT
# @REQUIRED
# @DESCRIPTION:
# This variable contains a space separated list of targets (see above) a package
# is compatible to. It must be set before the `inherit' call. There is no
# default. All ebuilds are expected to set this variable.


# @ECLASS_VARIABLE: RUBY_DEPS
# @DEFAULT_UNSET
# @DESCRIPTION:
#
# This is an eclass-generated Ruby dependency string for all
# implementations listed in USE_RUBY. Any one of the supported ruby
# targets will satisfy this dependency. A dependency on
# virtual/rubygems is also added to ensure that this is installed
# in time for the package to use it.
#
# Example use:
# @CODE
# RDEPEND="${RUBY_DEPS}
#   dev-foo/mydep"
# BDEPEND="${RDEPEND}"
# @CODE
#
# Example value:
# @CODE
# || ( dev-lang/ruby:3.0 dev-lang/ruby:2.7 ) virtual/rubygems
# @CODE
#
# The order of dependencies will change over time to best match the
# current state of ruby targets, e.g. stable version first.

_ruby_single_implementations_depend() {
	local _ruby_implementation depend
	for _ruby_implementation in ${RUBY_TARGETS_PREFERENCE}; do
		if [[ ${USE_RUBY} =~ ${_ruby_implementation} ]]; then
			depend+=" ("
			depend+=" $(_ruby_implementation_depend ${_ruby_implementation})"
			depend+=" virtual/rubygems[ruby_targets_${_ruby_implementation}(-)]"
			depend+=" )"
		fi
	done
	echo "|| ( ${depend} )"
}

_ruby_single_set_globals() {
	RUBY_DEPS=$(_ruby_single_implementations_depend)
}
_ruby_single_set_globals

fi
