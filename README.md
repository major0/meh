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

## Installation

Copy the 'meh' script into your project and start writting tests in `tests/`
directory.

By default `meh` will process all tests found in a given directory (and sub
directories).  To inhibit this behavior one can force specific test orders or
test conditions by the addition of a `control` file in a given directory.

```
cat tests/__control__.t
# Test for our pre-requisites
test.cmd 'Has valid shell' 0 sh -c 'true'

# Process directories of tests in specified order
test.dir no_control
test.dir nesting
test.dir depends

test.command 'Success if error' 1 sh -c 'false'
test.output 'Regex pattern matching' '[a-z0-9]' echo 'abc123'

my_custom_func() { :; }
test.command 'Custom function' 0 my_custom_func
```

## License

This project is licensed under the GPLv2 (not GPLv2.2, GPLv3, etc).  For more
information see the COPYING file.

## Author

Mark Ferrell
