#!/bin/bash

# This file is part of the SSL Landscape:
#
# Ralph Holz, Lothar Braun, Nils Kammenhuber, and Georg Carle.
# The SSL Landscape - A Thorough Analysis of the X.509 PKI 
# Using Active and Passive Measurements. In Proc. ACM/USENIX 
# 11th Annual Internet Measurement Conference (IMC '11), Berlin, 
# Germany, November 2011
#
# It is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This code is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this file. If not, see <http://www.gnu.org/licenses/>.

# Code history:
# Original author: Ralph Holz, ralph@ralphholz.de


# You need to execute this script in the directory
# mozilla/security/nss/lib/ckfw/builtins; checked
# out as a CVS repository.

# You can rewrite it, of course, to use
# CVS directly -- see parse_revisions for
# instructions how to access the Mozilla CVS repo.

# The CVS is closed. Last revision number was 1.87,
# so we can hard-code that.

mkdir certdata_by_rev
for REVNUM in {1..87}
do
    cvs update -r 1.$REVNUM certdata.txt
    cp certdata.txt certdata_by_rev/certdata.r1.${REVNUM}.txt
done
