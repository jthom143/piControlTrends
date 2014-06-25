%CNRM_CM5_taux loads in the windstress data for the CNRM CM5 model and calculates the westerly wind jet and location and then calcuates the trend pdfs for these two variables. 

close all
clear all

%% Import Data
current_path = pwd;
pathname_taux1 = fullfile(current_path, 'piControlData/CNRM_CM5_windstress/data(1).cdf');     % CDF file from Lamont website
pathname_taux2 = fullfile(current_path, 'piControlData/CNRM_CM5_windstress/data.cdf');     % CDF file from Lamont website
pathname_taux3 = fullfile(current_path, 'piControlData/CNRM_CM5_windstress/data(2).cdf');     % CDF file from Lamont website

%pathname_coord = fullfile(current_path, 'piControlData/');                      % CDF file from Lamont website does not contain lat and lon variables. 'pathname_coord' file downloaded from ESGF website to obtain these variables.


taux1 = ncread(pathname_taux1,'tauuo'); %N/m^2
taux2 = ncread(pathname_taux2,'tauuo');
taux3 = ncread(pathname_taux3,'tauuo');

time1 = ncread(pathname_taux1,'T');
time2 = ncread(pathname_taux2,'T');
time3 = ncread(pathname_taux3,'T');

%lat = ncread(pathname_coord, 'lat');
%lon = ncread(pathname_coord, 'lon');

taux = cat(3, taux1, taux2, taux3);
time = cat(1, time1, time2, time3);

clear current_path pathname_taux1 pathname_taux2 pathname_taux3
clear taux1 taux2 taux3 time1 time2 time3

cd NewFiles

save('CNRM_CM5_windstress.mat', 'taux', 'time', '-v7.3');
cd /Users/jordanthomas/piControlTrends


