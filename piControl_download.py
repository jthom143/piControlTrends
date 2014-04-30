#!/Users/jordanthomas/Library/Enthought/Canopy_64bit/User/bin/python

####################################################################################################
# Function to download CMIP5 piControl data from Lamont Website
# Data provided by Karen Smith and Lorenzo Polvani, Columbia University
# Jordan Thomas (jthom143@jhu.edu)
####################################################################################################

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

print 'Access 0 Surface Pressure Units: {}' .format(ps_units_access0)
print 'Access 0 Time Units: {}' .format(time_units_access0)

"""
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

print 'Access 3 Surface Pressure Units: {}' .format(ps_units_access3)
print 'Access 3 Time Units: {}' .format(time_units_access3)
"""
    
# BCC CSM1-1-m

print('Retrieving BCC CSM Data')

fileobj = S.NetCDFFile('http://strega.ldeo.columbia.edu:81/CMIP5/.byScenario/.piControl/.atmos/.mon/.ps/.bcc-csm1-1-m/.r1i1p1/dods')

ps_bcc = fileobj.variables['ps'].getValue()    #Import surface pressure
ps_units_bcc = fileobj.variables['ps'].units   # Units: Pa
time_bcc = fileobj.variables['T'].getValue()   # Import time
time_units_bcc = fileobj.variables['T'].units  # Units: months since 0001-01-01

lat_bcc = fileobj.variables['lat'].getValue()
lat_units_bcc = fileobj.variables['lat'].units

lon_bcc = fileobj.variables['lon'].getValue()
lon_units_bcc = fileobj.variables['lon'].units

fileobj.close()

ps_bcc = ps_bcc/100    # Change units to hPa
ps_units_bcc = 'hPa'       # Change unit string

print 'BCC CSM Surface Pressure Units: {}' .format(ps_units_bcc)
print 'BCC CSM Time Units: {}' .format(time_units_bcc)

# BNU ESM

print('Retrieving BNU ESM Data')

fileobj = S.NetCDFFile('http://strega.ldeo.columbia.edu:81/CMIP5/.byScenario/.piControl/.atmos/.mon/.ps/.BNU-ESM/.r1i1p1/.ps/dods')

ps_bnu = fileobj.variables['ps'].getValue()    #Import surface pressure
ps_units_bnu = fileobj.variables['ps'].units   # Units: Pa
time_bnu = fileobj.variables['T'].getValue()   # Import time
time_units_bnu = fileobj.variables['T'].units  # Units: months since 0300-01-01

lat_bnu = fileobj.variables['lat'].getValue()
lat_units_bnu = fileobj.variables['lat'].units

lon_bnu = fileobj.variables['lon'].getValue()
lon_units_bnu = fileobj.variables['lon'].units

fileobj.close()

ps_bnu = ps_bnu/100    # Change units to hPa
ps_units_bnu = 'hPa'       # Change unit string

print 'BNU ESM Surface Pressure Units: {}' .format(ps_units_bcc)
print 'BNU ESM Time Units: {}' .format(time_units_bcc)