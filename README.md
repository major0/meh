# README

My Eleventh Hour (meh) is a test-automation tool written in POSIX shell.

## Features

 - Dependancies: no more running tests which that depend on the success of
   some other test.

 - Ability to use shell code to orchastrate complex tests.

 - Directories as test groups

 - Portability: Written completely in POSIX shell (FreeBSD, NetBSD, OpenBSD,
   GNU/Linux, and any other platform that supports and real POSIX shell).

## TODO

 - Parallelization: Execute multiple tests in parallel.

 - Support `not` conditional for `test.command`

 - Support for automatic 'Tested-By' commit integration w/ git-hook.

 - Support for tracking test results in [git-track](http://github.com/major0/gitrack)

## Installation

 1. Copy the 'meh' script into your project.
 2. Make a `tests` directory in the top of your project.
 3. Add tests to the newly created tests directory. (e.g. `${topdir}/tests/test1.t`)

By default `meh` will process all tests found in a given directory (and sub
directories):

```
$ ls tests/*.t
tests/test1.t
tests/test2.t
tests/test3.t
```

To inhibit this behavior one can force specific test orders or test conditions
by the addition of a `control` file in a given directory.

```
cat tests/__control__.t
# Test for our pre-requisites
test.cmd 'Has valid shell' 0 sh -c 'true'

# Process directories of tests in specified order
test.dir no_control
test.dir nesting
test.dir depends

test.command 'Success if error' 1 sh -c 'false'
test.pattern 'Regex pattern matching' '[a-z0-9]' echo 'abc123'

my_custom_func() { :; }
test.command 'Custom function' 0 my_custom_func
```

## Test conditions

 * `test.command <test description> <return status> <command> <args> ...`
 * `test.pattern <test description> <regexp> <command <args> ...`
 * `test.dir <path>`


## License

This project is licensed under the GPLv2 (not GPLv2.2, GPLv3, etc).  For more
information see the COPYING file.

## Author

Mark Ferrell
