 function [ jet_f, jet_xi, mean_jet, std_jet, jet_trends_yrs, jet_loc_f, jet_loc_xi, mean_jet_loc, std_jet_loc, jet_loc_trends_yrs, time_year ] = GFDL_ESM2G_taux

%GFDL_ESM2G_taux loads in the windstress data for the CNRM CM5 2 model and calculates the westerly wind jet and location and then calcuates the trend pdfs for these two variables. 


%% Import Data
current_path = pwd;
pathname_taux = fullfile(current_path, 'piControlData/GFDL_ESM2G/GFDL_ESM2G_taux.cdf');     % CDF file from Lamont website


taux = ncread(pathname_taux,'tauuo'); %N/m^2
time = ncread(pathname_taux,'T');

lat = ncread(pathname_taux, 'rlat');
lon = ncread(pathname_taux, 'rlon');


clear current_path pathname_taux 

%% Change from single type to double type
lat = double(lat);
lon = double(lon);
taux = double(taux);

%% Change land values to be NaNs
taux(taux>1e15)=NaN;

%% Plot Raw Data for first time step
% figure(1)
% axesm miller
% surfacem(lat, lon, squeeze(taux(:,:,1)))
% title('GFDL ESM2G Surface Windstress - Original Grid', 'fontsize', 12)
% colorbar
% set(gca, 'fontsize', 12)
% set(gcf, 'position', [100, 100, 1049, 895])


%% Create Useful time vectors
time_year = 1:500;

%% Jet Strength and Location Analysis

[ ~, ~, ~, jet_ann, lat_jet_ann ] = taux_findmax( taux, lat, time );                                              

%% Trend Analysis PDFs

trend_period = 30;
trend_length = 30;

[jet_f, jet_xi, mean_jet, std_jet, jet_trends_yrs, jet_loc_f, jet_loc_xi, mean_jet_loc, std_jet_loc, jet_loc_trends_yrs] = Windstress_Trends( time_year, jet_ann, lat_jet_ann, trend_period, trend_length );

end


