#!/Users/jordanthomas/Library/Enthought/Canopy_64bit/User/bin/python

##########################################################################################################
# Function to download CMIP5 piControl data from Lamont Website
# Data provided by Karen Smith and Lorenzo Polvani, Columbia University
# Jordan Thomas (jthom143@jhu.edu)
##########################################################################################################

import Scientific.IO.NetCDF as S
import numpy


# Access 0

print('Retrieving Access 0 Data...')

fileobj = S.NetCDFFile('http://strega.ldeo.columbia.edu:81/CMIP5/.byScenario/.piControl/.atmos/.mon/.ps/ACCESS1-0/.r1i1p1/.ps/lat/%2890S%29%280N%29RANGEEDGES/dods', mode='r')

ps_access0 = fileobj.variables['ps'].getValue()    # Import surface pressure
ps_units_access0 = fileobj.variables['ps'].units   # Units: Pa

time_access0 = fileobj.variables['T'].getValue()   # Import time
time_units_access0 = fileobj.variables['T'].units  # Units: months since 0300-01-01

lat_access0 = fileobj.variables['lat'].getValue()
lat_units_access0 = fileobj.variables['lat'].units

lon_access0 = fileobj.variables['lon'].getValue()
lon_units_access0 = fileobj.variables['lon'].units

fileobj.close()

ps_access0 = ps_access0/100    # Change units to hPa
ps_units_access0 = 'hPa'       # Change unit string 

print ps_units_access0


# Access 3

print('Retrieving Access 3 Data...')

fileobj = S.NetCDFFile('http://strega.ldeo.columbia.edu:81/CMIP5/.byScenario/.piControl/.atmos/.mon/.ps/.ACCESS1-3/.r1i1p1/.ps/dods', mode='r')

ps_access3 = fileobj.variables['ps'].getValue()    # Import surface pressure
ps_units_access3 = fileobj.variables['ps'].units   # Units: Pa

time_access3 = fileobj.variables['T'].getValue()   # Import time
time_units_access3 = fileobj.variables['T'].units  # Units: months since 0300-01-01

lat_access3 = fileobj.variables['lat'].getValue()
lat_units_access3 = fileobj.variables['lat'].units

lon_access3 = fileobj.variables['lon'].getValue()
lon_units_access3 = fileobj.variables['lon'].units

fileobj.close()

ps_access0 = ps_access0/100    # Change units to hPa
ps_units_access0 = 'hPa'       # Change unit string

print ps_units_access3

