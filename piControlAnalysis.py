# File: piControlAnalysis.py
#
# Overview:
#    Load in CMIP5 pre-industrial control data and do surface trend
#    analysis for SAM index.
#
# JordanThomas
# May 7, 2014
#

#
# Import Python modules to be used
#
import numpy
import sys,os

#
# Import NIO (for reading netCDF files)
#
import NIO

#
# Import Ngl support functions
#
import Ngl

#
# Open the netCDF file.
#
cdf_file = Nio.open_file())