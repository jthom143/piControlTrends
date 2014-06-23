%NOR_ESM1m_M_taux loads in the windstress data for the NOR ESM1m M model and calculates the westerly wind jet and location and then calcuates the trend pdfs for these two variables. 

close all
clear all


%% Import Data
current_path = pwd;
pathname_taux1 = fullfile(current_path, 'piControlData/NOR_ESM1m_M_windstress/data(10).cdf');     % CDF file from Lamont website
pathname_taux2 = fullfile(current_path, 'piControlData/NOR_ESM1m_M_windstress/data(11).cdf');     % CDF file from Lamont website

%pathname_coord = fullfile(current_path, 'piControlData/');                      % CDF file from Lamont website does not contain lat and lon variables. 'pathname_coord' file downloaded from ESGF website to obtain these variables.


taux1 = ncread(pathname_taux1,'tauuo'); %N/m^2
taux2 = ncread(pathname_taux2,'tauuo');


time1 = ncread(pathname_taux1,'T');
time2 = ncread(pathname_taux2,'T');


%lat = ncread(pathname_coord, 'lat');
%lon = ncread(pathname_coord, 'lon');

taux = cat(3, taux1, taux2);
time = cat(1, time1, time2);


clear current_path pathname_taux1 pathname_taux2
clear taux1 taux2 time1 time2

cd NewFiles

save('NOR_ESM1m_M_windstress.mat', 'taux', 'time', '-v7.3');
cd /Users/jordanthomas/piControlTrends


