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
