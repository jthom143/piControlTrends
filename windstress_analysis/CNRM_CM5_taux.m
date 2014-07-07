 function [ jet_f, jet_xi, mean_jet, std_jet, jet_trends_yrs, jet_loc_f, jet_loc_xi, mean_jet_loc, std_jet_loc, jet_loc_trends_yrs, time_year, jet_ann, lat_jet_ann ] = CNRM_CM5_taux

%CNRM_CM5_taux loads in the windstress data for the CNRM CM5 model and calculates the westerly wind jet and location and then calcuates the trend pdfs for these two variables. 


%% Import Data
% current_path = pwd;
% pathname_taux1 = fullfile(current_path, 'piControlData/CNRM_CM5/data.cdf');     % CDF file from Lamont website
% pathname_taux2 = fullfile(current_path, 'piControlData/CNRM_CM5/data(1).cdf');     % CDF file from Lamont website
% pathname_taux3 = fullfile(current_path, 'piControlData/CNRM_CM5/data(2).cdf');     % CDF file from Lamont website
% pathname_taux4 = fullfile(current_path, 'piControlData/CNRM_CM5/data(3).cdf');     % CDF file from Lamont website
% 
% pathname_coord = fullfile(current_path, 'piControlData/CNRM_CM5/tauuo_Omon_CNRM-CM5_piControl_r1i1p1_185001-185912.nc');                      % CDF file from Lamont website does not contain lat and lon variables. 'pathname_coord' file downloaded from ESGF website to obtain these variables.
% 
% 
% taux1 = ncread(pathname_taux1,'tauuo'); %N/m^2
% taux2 = ncread(pathname_taux2,'tauuo');
% taux3 = ncread(pathname_taux3,'tauuo');
% taux4 = ncread(pathname_taux4, 'tauuo');
% 
% time1 = ncread(pathname_taux1,'T');
% time2 = ncread(pathname_taux2,'T');
% time3 = ncread(pathname_taux3,'T');
% time4 = ncread(pathname_taux4, 'T');
% 
% lat = ncread(pathname_coord, 'lat');
% lon = ncread(pathname_coord, 'lon');
% 
% taux = cat(3, taux1, taux2, taux3, taux4);
% time = cat(1, time1, time2, time3, time4);
% 
% clear current_path pathname_taux1 pathname_taux2 pathname_taux3 pathname_taux4
% clear taux1 taux2 taux3 taux4 time1 time2 time3 time4
% 
% %% Regridding
% 
% % Change from single type to double type
% lat = double(lat);
% lon = double(lon);
% taux = double(taux);
% 
% % Change land values to be NaNs
% taux(taux>1e15)=NaN;
% 
% % Plot Raw Data for first time step
% figure(1)
% axesm miller
% surfacem(lat, lon, squeeze(taux(:,:,1)))
% title('MPI ESM MR Surface Windstress - Original Grid', 'fontsize', 12)
% colorbar
% set(gca, 'fontsize', 12)
% set(gcf, 'position', [100, 100, 1049, 895])
% 
% % Regridding
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
% save('CNRM_CM5_windstress.mat', 'taux', 'time','lat', 'lon', '-v7.3');

load piControlData/CNRM_CM5/CNRM_CM5_windstress.mat

%% Create Useful time vectors
time_year = 1:850;

%% Create lat and lon vectors 
lat_matrix = lat;
lon_matrix = lon;

clear lat lon

lat = lat_matrix(:,1);
lon = lon_matrix(1,:);

%% Jet Strength and Location Analysis

[ ~, ~, ~, jet_ann, lat_jet_ann ] = taux_findmax( taux, lat, time );                                              

%% Trend Analysis PDFs

trend_period = 30;
trend_length = 30;

[jet_f, jet_xi, mean_jet, std_jet, jet_trends_yrs, jet_loc_f, jet_loc_xi, mean_jet_loc, std_jet_loc, jet_loc_trends_yrs] = Windstress_Trends( time_year, jet_ann, lat_jet_ann, trend_period, trend_length );

end
