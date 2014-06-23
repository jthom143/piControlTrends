%MPI_ESM_LR_taux loads in the windstress data for the MPI ESM LR model and calculates the westerly wind jet and location and then calcuates the trend pdfs for these two variables. 

close all
clear all


%% Import Data
current_path = pwd;
pathname_taux1 = fullfile(current_path, 'piControlData/MPI_ESM_LR/data.cdf');     % CDF file from Lamont website
pathname_taux2 = fullfile(current_path, 'piControlData/MPI_ESM_LR/data(1).cdf');     % CDF file from Lamont website
pathname_taux3 = fullfile(current_path, 'piControlData/MPI_ESM_LR/data(2).cdf');     % CDF file from Lamont website

pathname_coord = fullfile(current_path, 'piControlData/MPI_ESM_LR/tauuo_Omon_MPI-ESM-LR_esmControl_r1i1p1_185001-189912.nc');                      % CDF file from Lamont website does not contain lat and lon variables. 'pathname_coord' file downloaded from ESGF website to obtain these variables.


taux1 = ncread(pathname_taux1,'tauuo'); %N/m^2
taux2 = ncread(pathname_taux2,'tauuo');
taux3 = ncread(pathname_taux3,'tauuo');


time1 = ncread(pathname_taux1,'T');
time2 = ncread(pathname_taux2,'T');
time3 = ncread(pathname_taux3,'T');


lat = ncread(pathname_coord, 'lat');
lon = ncread(pathname_coord, 'lon');

taux = cat(3, taux1, taux2, taux3);
time = cat(1, time1, time2, time3);


clear current_path pathname_taux1 pathname_taux2
clear taux1 taux2 taux3 time1 time2 time3


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

cd /Users/jordanthomas/piControlTrends/MPI_ESM_LR

save('MPI_ESM_LR_windstress.mat', 'taux', 'time', '-v7.3');

cd /Users/jordanthomas/piControlTrends


