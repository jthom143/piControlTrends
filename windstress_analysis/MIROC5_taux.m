 function [ jet_f, jet_xi, mean_jet, std_jet, jet_trends_yrs, jet_loc_f, jet_loc_xi, mean_jet_loc, std_jet_loc, jet_loc_trends_yrs, time_year ] = MIROC5_taux

%MIROC5_taux loads in the windstress data for the CMCC CESM model and calculates the westerly wind jet and location and then calcuates the trend pdfs for these two variables.

%% Import Data
% current_path = pwd;
% pathname_taux = fullfile(current_path, 'piControlData/MIROC5/MIROC5_taux.cdf');     % CDF file from Lamont website
% pathname_coord = fullfile(current_path, 'piControlData/MIROC5/tauuo_Omon_MIROC5_piControl_r1i1p1_260001-266912.nc');                      % CDF file from Lamont website does not contain lat and lon variables. 'pathname_coord' file downloaded from ESGF website to obtain these variables.
% 
% taux = ncread(pathname_taux,'tauuo');
% time = ncread(pathname_taux,'T');
% lat = ncread(pathname_coord, 'lat');
% lon = ncread(pathname_coord, 'lon');
% 
% 
% clear pathname_ps pathname_coord
% 
% %% Change from single type to double type
% lat = double(lat);
% lon = double(lon);
% taux = double(taux);
% 
% %% Change land values to be NaNs
% taux(taux>1e15)=NaN;
% taux(taux==0)=NaN;  
% 
% %% Plot Raw Data for first time step
% figure(1)
% axesm miller
% surfacem(lat, lon, squeeze(taux(:,:,1)))
% title('MIROC5 Surface Windstress - Original Grid', 'fontsize', 12)
% colorbar
% set(gca, 'fontsize', 12)
% set(gcf, 'position', [100, 100, 1049, 895])
% 
% %% Regridding
% for i = 1:length(time);
% [lon_new, lat_new, taux_new(:,:,i)] = griddata(lon, lat, squeeze(taux(:,:,i)), [0:360], [-90:90]');
% end
% 
% lat = lat_new;
% lon = lon_new;
% taux = taux_new;
% 
% clear lat_new lon_new taux_new
% 
% save('MIROC5_windstress.mat', 'taux', 'time','lat', '-v7.3');

load piControlData/MIROC5/MIROC5_windstress.mat
load lat_lon.mat

%% Create Useful time vectors
time_year = 1:670;

%% Create lat and lon vectors 
lat_matrix = lat;
lon_matrix = lon;

clear lat lon

lat = lat_matrix(:,1);
lon = lon_matrix(1,:);

%% Clearn up windstress
taux(taux==0)=NaN;

%% Jet Strength and Location Analysis

[ ~, ~, ~, jet_ann, lat_jet_ann ] = taux_findmax( taux, lat, time );                                              

%% Trend Analysis PDFs

trend_period = 30;
trend_length = 30;

[jet_f, jet_xi, mean_jet, std_jet, jet_trends_yrs, jet_loc_f, jet_loc_xi, mean_jet_loc, std_jet_loc, jet_loc_trends_yrs] = Windstress_Trends( time_year, jet_ann, lat_jet_ann, trend_period, trend_length );

end