function [ jet_strength_f, jet_strength_xi, mean_jet_strength, std_jet_strength, jet_location_f, jet_location_xi, mean_jet_location, std_jet_location, time_year, jet_strength, jet location ] = IPSL_CM5b_LR_taux

%CMCC_CESM_taux loads in the windstress data for the CMCC CESM model and calculates the westerly wind jet and location and then calcuates the trend pdfs for these two variables.

%% Import Data
current_path = pwd;
pathname_taux = fullfile(current_path, 'piControlData/IPSL_CM5b_LR_taux.cdf');     % CDF file from Lamont website
pathname_coord = fullfile(current_path, 'piControlData/IPSL-CM5B-LR_tauuo_Omon_piControl_r1i1p1_183001-212912.nc');                      % CDF file from Lamont website does not contain lat and lon variables. 'pathname_coord' file downloaded from ESGF website to obtain these variables.


taux = ncread(pathname_taux,'tauuo');
time = ncread(pathname_taux,'T');
lat = ncread(pathname_coord, 'lat');
lon = ncread(pathname_coord, 'lon');


clear pathname_ps pathname_coord

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

%% Regridding
for i = 1:length(time);
[lon_new, lat_new, taux_new(:,:,i)] = griddata(lon, lat, squeeze(taux(:,:,i)), [0:360], [-90:90]');
end
                                               
                                               
%% Create Useful time vectors
                                               
                                               
time_year = 1:300;
                                               
clear time
                                               
%% Jet Strength and Location Analysis
                                               
                                               
%% Trend Analysis PDFs
                                               
 trend_period = 30;
 trend_length = 30;
                                               
[ sam_f, sam_xi, mean_sam, std_sam] = SAM_Trends( time_year, SAM_unnormalized, trend_period, trend_length );
                                               
end