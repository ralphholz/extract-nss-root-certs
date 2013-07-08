#!/bin/bash

for ((REVNUM=$1;REVNUM<=$2;REVNUM++))
do
    echo "Doing revision 1.$REVNUM now"
    go run convert_mozilla_certdata.go --in-file certdata_by_rev/certdata.r1.$REVNUM.txt --out-file certdata_by_rev/certdata.r1.$REVNUM.crt
done
