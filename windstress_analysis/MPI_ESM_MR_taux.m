 function [ jet_f, jet_xi, mean_jet, std_jet, jet_trends_yrs, jet_loc_f, jet_loc_xi, mean_jet_loc, std_jet_loc, jet_loc_trends_yrs, time_year, jet_ann, lat_jet_ann ] = MPI_ESM_MR_taux

%MPI_ESM_MR_taux loads in the windstress data for the MPI ESM MR model and calculates the westerly wind jet and location and then calcuates the trend pdfs for these two variables. 


%% Import Data
% current_path = pwd;
% pathname_taux1 = fullfile(current_path, 'piControlData/MPI_ESM_MR/data.cdf');     % CDF file from Lamont website
% pathname_taux2 = fullfile(current_path, 'piControlData/MPI_ESM_MR/data(1).cdf');     % CDF file from Lamont website
% pathname_taux3 = fullfile(current_path, 'piControlData/MPI_ESM_MR/data(2).cdf');     % CDF file from Lamont website
% pathname_taux4 = fullfile(current_path, 'piControlData/MPI_ESM_MR/data(3).cdf');     % CDF file from Lamont website
% pathname_taux5 = fullfile(current_path, 'piControlData/MPI_ESM_MR/data(4).cdf');     % CDF file from Lamont website
% pathname_taux6 = fullfile(current_path, 'piControlData/MPI_ESM_MR/data(5).cdf');     % CDF file from Lamont website
% pathname_taux7 = fullfile(current_path, 'piControlData/MPI_ESM_MR/data(6).cdf');     % CDF file from Lamont website
% pathname_taux8 = fullfile(current_path, 'piControlData/MPI_ESM_MR/data(7).cdf');     % CDF file from Lamont website
% pathname_taux9 = fullfile(current_path, 'piControlData/MPI_ESM_MR/data(8).cdf');     % CDF file from Lamont website
% pathname_taux10 = fullfile(current_path, 'piControlData/MPI_ESM_MR/data(9).cdf');     % CDF file from Lamont website
% 
% 
% taux1 = ncread(pathname_taux1,'tauuo'); %N/m^2
% taux2 = ncread(pathname_taux2,'tauuo');
% taux3 = ncread(pathname_taux3,'tauuo');
% taux4 = ncread(pathname_taux4,'tauuo');
% taux5 = ncread(pathname_taux5,'tauuo');
% taux6 = ncread(pathname_taux6,'tauuo');
% taux7 = ncread(pathname_taux7,'tauuo');
% taux8 = ncread(pathname_taux8,'tauuo');
% taux9 = ncread(pathname_taux9,'tauuo');
% taux10 = ncread(pathname_taux10,'tauuo');
% 
% 
% time1 = ncread(pathname_taux1,'T');
% time2 = ncread(pathname_taux2,'T');
% time3 = ncread(pathname_taux3,'T');
% time4 = ncread(pathname_taux4,'T');
% time5 = ncread(pathname_taux5,'T');
% time6 = ncread(pathname_taux6,'T');
% time7 = ncread(pathname_taux7,'T');
% time8 = ncread(pathname_taux8,'T');
% time9 = ncread(pathname_taux9,'T');
% time10 = ncread(pathname_taux10,'T');
% 
% 
% taux = cat(3, taux1, taux2, taux3, taux4, taux5, taux6, taux7, taux8, taux9, taux10);
% time = cat(1, time1, time2, time3, time4, time5, time6, time7, time8, time9, time10);
% 
% 
% clear current_path pathname_taux1 pathname_taux2 pathname_taux3 pathname_taux4 pathname_taux5 pathname_taux6 pathname_taux7 pathname_taux8 pathname_taux9 pathname_taux10
% clear taux1 taux2 taux3 taux4 taux5 taux6 taux7 taux8 taux9 taux10 time1 time2 time3 time4 time5 time6 time7 time8 time9 time10
% 
% cd /Users/jordanthomas/piControlTrends/piControlData/MPI_ESM_MR
% 
% save('MPI_ESM_MR_windstress_ungridded.mat', 'taux', 'time', '-v7.3');
% 
% cd /Users/jordanthomas/piControlTrends
% 
% 
% %% Regridding
% current_path = pwd;
% pathname_coord = fullfile(current_path, 'piControlData/MPI_ESM_MR/tauuo_Omon_MPI-ESM-MR_piControl_r1i1p1_200001-200512.nc');                      % CDF file from Lamont website does not contain lat and lon variables. 'pathname_coord' file downloaded from ESGF website to obtain these variables.
% 
% lat = ncread(pathname_coord, 'lat');
% lon = ncread(pathname_coord, 'lon');
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
% cd /Users/jordanthomas/piControlTrends/piControlData/MPI_ESM_MR
% 
% save('MPI_ESM_MR_windstress.mat', 'taux', 'time', '-v7.3');
% 
% cd /Users/jordanthomas/piControlTrends
% 

load piControlData/MPI_ESM_MR/MPI_ESM_MR_windstress.mat
load lat_lon.mat

%% Create Useful time vectors
time_year = 1:1000;

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
