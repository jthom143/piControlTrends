function [ jet_f, jet_xi, mean_jet, std_jet, jet_trends_yrs, jet_loc_f, jet_loc_xi, mean_jet_loc, std_jet_loc, jet_loc_trends_yrs, time_year, jet_ann, lat_jet_ann ] = CanESM2_taux

%CanESM2_taux loads in the windstress data for the CMCC CESM model and calculates the westerly wind jet and location and then calcuates the trend pdfs for these two variables. 

%% Import Data
% current_path = pwd;
% pathname_taux1 = fullfile(current_path, 'piControlData/CanESM2/data.cdf');     % CDF file from Lamont website
% pathname_taux2 = fullfile(current_path, 'piControlData/CanESM2/data(1).cdf');     % CDF file from Lamont website
% 
% taux1 = ncread(pathname_taux1, 'tauuo');
% taux2 = ncread(pathname_taux2, 'tauuo');
% 
% time1 = ncread(pathname_taux1, 'T');
% time2 = ncread(pathname_taux2, 'T');
% 
% taux = cat(3, taux1, taux2);
% time = cat(1, time1, time2);
% 
% lat = ncread('piControlData/CanESM2/data.cdf', 'lat');
% lon = ncread('piControlData/CanESM2/data.cdf', 'lon');
% 
% 
% 
% clear current_path pathname_taux1 pathname_taux2 time1 time2 taux1 taux2
% 
% %% Change from single type to double type
% lat = double(lat);
% lon = double(lon);
% taux = double(taux);
% 
% %% Change land values to be NaNs
% taux(taux>1e15)=NaN;
% 
% save('CanESM2_windstress.mat', 'taux', 'time', 'lat', 'lon', '-v7.3');

load piControlData/CanESM2/CanESM2_windstress.mat

%% Create Useful time vectors
time_year = 1:996;

%% Jet Strength and Location Analysis

[ ~, ~, ~, jet_ann, lat_jet_ann ] = taux_findmax( taux, lat, time );                                              

%% Trend Analysis PDFs

trend_period = 30;
trend_length = 30;

[jet_f, jet_xi, mean_jet, std_jet, jet_trends_yrs, jet_loc_f, jet_loc_xi, mean_jet_loc, std_jet_loc, jet_loc_trends_yrs] = Windstress_Trends( time_year, jet_ann, lat_jet_ann, trend_period, trend_length );

end

