
%CCSM4_taux loads in the windstress data for the CMCC CESM model and calculates the westerly wind jet and location and then calcuates the trend pdfs for these two variables. 

%% Import Data
current_path = pwd;
pathname_taux = fullfile(current_path, 'piControlData/CCSM4/CCSM4_taux.cdf');     % CDF file from Lamont website

taux = ncread(pathname_taux, 'tauuo');
time = ncread(pathname_taux, 'T');

pathname_coord = fullfile(current_path, 'piControlData/CCSM4/tauuo_Omon_CCSM4_piControl_r1i1p1_025001-050012.nc' );                      % CDF file from Lamont website does not contain lat and lon variables. 'pathname_coord' file downloaded from ESGF website to obtain these variables.

lat = ncread(pathname_coord, 'lat');
lon = ncread(pathname_coord, 'lon');


clear current_path pathname_taux pathname_coord

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
title('CMCC CESM Surface Windstress - Original Grid', 'fontsize', 12)
colorbar
set(gca, 'fontsize', 12)
set(gcf, 'position', [100, 100, 1049, 895])

%% Regridding
for i = 1:length(time);
[lon_new, lat_new, taux_new(:,:,i)] = griddata(lon, lat, squeeze(taux(:,:,i)), [0:360], [-90:90]');
end

clear lat lon taux

lat = lat_new;
lon = lon_new;
taux = taux_new;

save('CCSM4_windstress.mat', 'taux', 'time', '-v7.3');
 
send_text_message('484-410-9322','AT&T','Code Finished','Test')

