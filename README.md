# Assert::Refute::T::*

This repository contains miscellanous packages
extending [Assert::Refute](https://metacpan.org/pod/Assert::Refute)
check arsenal.

Each module lives in its own separate directory `Assert-Refute-T-Name`
with lib, t, Makefile.PL, README, and all stuff.

# Files and tools

Use `make` to build all modules at once. `make test` will test them,
`make dist` will build module packages and put them in the root,
and `make clean` will remove all generated files.

The following additional files are present:

* `new_module.sh` - a script to generate new module in `Assert::Refute::T::*`
namespace from skeleton.

* `__skeleton__` - a base directory structure with a dummy module & test

* `make_all.sh` - call Makefile.PL in subdirectories, recursively
(used by Makefile)
