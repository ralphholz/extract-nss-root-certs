#!/usr/bin/python

import sys
import time
import calendar

"""
Read output of a

cvs -d :pserver:anonymous@cvs-mirror.mozilla.org:/cvsroot log certdata.txt > ~/certdata.txt.cvs.log

and fetch revision numbers from trunk, with timestamp. Output is a CSV.

To get a CVS copy of Mozilla code:
cvs -d :pserver:anonymous@cvs-mirror.mozilla.org:/cvsroot checkout mozilla
"""

def print_usage():
    print """
    Usage: parse_revisions.py cert_data outfile
        - cert_data the result of the above 'cvs log' command
        - outfile is destination file to write to
    """
    sys.exit(1)


if (len(sys.argv) != 3) :
    print_usage()


def main():
    infile = sys.argv[1]
    outfile = sys.argv[2]

    infh = open(infile, "r")
    outfh = open(outfile, "w")

    is_trunk = False
    rev = ""

    for line in infh:
        if line.startswith("revision"):
            rev = line.split(" ")[1].strip()
            if rev.count(".") > 1:
                is_trunk = False
                continue
            else:
                is_trunk = True

        if line.startswith("date: ") and is_trunk:
            date_item = line.split(";")[0]
            rev_date_string = date_item.lstrip("date: ")
            rev_date_tuple = time.strptime(rev_date_string, "%Y/%m/%d %H:%M:%S")
            rev_date_epochs = calendar.timegm(rev_date_tuple)
            outfh.write(rev + "," + str(rev_date_epochs) + "\n")

    infh.close()
    outfh.close()

main()
