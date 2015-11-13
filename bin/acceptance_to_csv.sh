#!/bin/bash
output=tests/app_matrix.csv
vms=$(ls -1 tests/app/)
vm_list="APP OK KO N/A $(for a in $vms; do echo "$a" ; done)"
echo $vm_list | sed 's/ /,/g'  > $output
for app in $(ls -1 modules/tinydata/data | grep -v default.yaml | grep -v test) ; do
  table_line=$(echo "$app"
  echo "$(find tests/app/ | grep "/$app$"  | grep "success/" | wc -l)"
  echo "$(find tests/app/ | grep "/$app$"  | grep "failure/" | wc -l)"
  echo "$(find tests/app/ | grep "/$app$"  | grep "na/" | wc -l)"
  for vm in $vms ; do
	  echo "$(find tests/app/$vm | grep "/$app$"  | cut -d '/' -f 4)" | sed "s/success/[OK](tests\/app\/$vm\/success\/$app)/g" | sed "s/failure/[failure](tests\/app\/$vm\/failure\/$app)/g"
  done
  )
  echo $table_line | sed 's/ /,/g' >> $output
done

echo $vm_list | sed 's/ /,/g'  >> $output

count_line_ok="SUCCESS - - - $(for vm in $vms ; do
  find tests/app/ | grep $vm  | grep success | wc -l | sed 's/\n/ /'
done)"
echo $count_line_ok | sed 's/ /,/g'  >> $output

count_line_ko="FAILURE - - - $(for vm in $vms ; do
  find tests/app/ | grep $vm  | grep failure | wc -l | sed 's/\n/ /'
done)"

echo $count_line_ko | sed 's/ /,/g'  >> $output


