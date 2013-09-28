#!/usr/bin/python

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



import sys
import os
import re
import time
import calendar

def print_usage():
    print """
    Usage: count_certs_in_root_store.py cert_data_dir revisions outfile
        - cert_data_dir: where to find the *.crt
        - file containing revision numbers with timestamps (see parse-revisions.py)
        - otufile: where to write CSV result to
    """
    sys.exit(1)


if (len(sys.argv) != 4) :
    print_usage()


def main():
    indir = sys.argv[1]
    revfile = sys.argv[2]
    outfile = sys.argv[3]
    
    # Read revision information into a dictionary
    revf = open(revfile, "r")
    rev_lines = {}
    for line in revf:
        rev, timestamp = line.split(",")
        rev_lines[rev] = timestamp
    revf.close()   

    re_rev = re.compile("certdata\.r(.*)\.crt")
    re_cert = re.compile("-----BEGIN CERTIFICATE-----")

    crt_files = []
    for root, dirs, files in os.walk(indir, followlinks=True):
        crt_files = filter(lambda x: "crt" in x, files)

    outf = open(outfile, "w")
    for crt_file in crt_files:
        rev = re_rev.search(crt_file).group(1).strip()
        crtf = open(indir + "/" + crt_file, "r")
        crtf_content = crtf.read()
        crtf.close()
        num_certs = str(len(re_cert.findall(crtf_content)))
        # print "Rev: " + rev + " Time: " + rev_lines[rev].strip() + " Count: " + num_certs
        outf.write(rev + "," + rev_lines[rev].strip() + "," + num_certs + "\n")
    outf.close()

   
main()
