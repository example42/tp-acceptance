#!/bin/bash
# Requires: pip3 install csvtomd

output=tests/app_summary.md
vms=$(ls -1 tests/app/)
bin/acceptance_to_csv.sh

echo "# Tiny Puppet - APP acceptance tests compatibility matrix" > $output
echo "### Generated: $(date)" >> $output
echo "**NOTE** - Many failures don't imply lack of tp support for an application: in many cases services don't start because they are not configured by default. Check the *failure* link for more info" >> $output
echo >> $output

csvtomd tests/app_matrix.csv >> $output



