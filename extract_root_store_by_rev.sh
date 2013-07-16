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


for ((REVNUM=$1;REVNUM<=$2;REVNUM++))
do
    echo "Doing revision 1.$REVNUM now"
    go run convert_mozilla_certdata.go --in-file certdata_by_rev/certdata.r1.$REVNUM.txt --out-file certdata_by_rev/certdata.r1.$REVNUM.crt
done
