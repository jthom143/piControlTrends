%CNRM_CM52_taux loads in the windstress data for the CNRM CM5 2 model and calculates the westerly wind jet and location and then calcuates the trend pdfs for these two variables. 

close all
clear all

%% Import Data
current_path = pwd;
pathname_taux = fullfile(current_path, 'piControlData/CNRM_CM52/CNRM_CM52_taux.cdf');     % CDF file from Lamont website

pathname_coord = fullfile(current_path, 'piControlData/CNRM_CM52/tauuo_Omon_CNRM-CM5-2_piControl_r1i1p1_185001-185912.nc');                      % CDF file from Lamont website does not contain lat and lon variables. 'pathname_coord' file downloaded from ESGF website to obtain these variables.

taux = ncread(pathname_taux,'tauuo'); %N/m^2
time = ncread(pathname_taux,'T');

lat = ncread(pathname_coord, 'lat');
lon = ncread(pathname_coord, 'lon');


clear current_path pathname_taux

%% Change from single type to double type
lat = double(lat);
lon = double(lon);
taux = double(taux);

%% Change land values to be NaNs
taux(taux>1e15)=NaN;

%% Plot Raw Data for first time step
figure(1)
axesm miller
surfacem(lat, lon, squeeze(taux(:,:,1)))
title('CNRM CM52 Surface Windstress - Original Grid', 'fontsize', 12)
colorbar
set(gca, 'fontsize', 12)
set(gcf, 'position', [100, 100, 1049, 895])

%% Regridding
for i = 1:length(time);
[lon_new, lat_new, taux_new(:,:,i)] = griddata(lon, lat, squeeze(taux(:,:,i)), [0:360], [-90:90]');
end

lat = lat_new;
lon = lon_new;
taux = taux_new;

clear lat_new lon_new taux_new

save('CNRM_CM52_windstress.mat', 'taux', 'time', '-v7.3');

beep


