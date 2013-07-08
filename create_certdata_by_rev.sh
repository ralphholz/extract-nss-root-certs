#!/bin/bash

# You need to execute this script in the directory
# mozilla/security/nss/lib/ckfw/builtins; checked
# out as a CVS repository.

# You can rewrite it, of course, to use
# CVS directly -- see parse_revisions for
# instructions how to access the Mozilla CVS repo.

mkdir certdata_by_rev
for REVNUM in {1..87}
do
    cvs update -r 1.$REVNUM certdata.txt
    cp certdata.txt certdata_by_rev/certdata.r1.${REVNUM}.txt
done
