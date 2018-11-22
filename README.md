# Assert::Refute::T::*

This repository contains miscellanous packages
extending [Assert::Refute](https://metacpan.org/pod/Assert::Refute)
check arsenal.

Each directory starting with a capital letteri
is a standalone, functional, and complete CPAN distribution
built using standard Makefile.PL directory layout.

This bundle only exists to allow a contributor (you)
to know that there are multiple modules, and how they are built together.

# Files and tools

* `Makefile` - handles `test`, `dist`, `manifest`, and `clean`
targets recursively

* `Runme.PL` - used by Makefile internally.

* `.githooks/` - original author's git hooks are in this directory,
together with `.githooks/setup.sh`.

* `new_module.sh` - a script to generate new module in `Assert::Refute::T::*`
namespace from skeleton.

* `__skeleton__/` - a base directory structure with a dummy module & test


