#!/usr/bin/python

import sys
import time

"""
Create a CSV file you might want when plotting with R.
Define a vector of dates - the script will generate
a CSV of date and epochs.
"""

def main():

    # all times are UTC
    date_vector = ["2000-09-01", "2001-01-01", "2002-01-01", "2003-01-01", "2004-01-01", "2005-01-01", "2006-01-01", "2007-01-01", "2008-01-01", "2009-01-01", "2010-01-01", "2011-01-01", "2012-01-01", "2013-01-01"]

    outf = open("ticks_for_plot.csv", "w")
    for date in date_vector:
        epoch = int(time.mktime(time.strptime(date + " 00:00:00", "%Y-%m-%d %H:%M:%S")))
        outf.write(date + "," + str(epoch) + "\n")
    outf.close()
main()
