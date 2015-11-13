#!/bin/bash
# Requires: pip3 install csvtomd

output=tests/app_summary.md
vms=$(ls -1 tests/app/)
bin/acceptance_to_csv.sh

echo "# Tiny Puppet - APP acceptance tests compatibility matrix" > $output
echo "### Generated: $(date)" >> $output
csvtomd tests/app_matrix.csv >> $output



